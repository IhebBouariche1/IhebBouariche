using System;
using System.Net.Sockets;
using System.Text;
using System.Threading;
using System.Windows.Forms;

namespace Agent
{
    public partial class Form1 : Form
    {
        private TcpClient tcpClient;
        private NetworkStream stream;
        private const string serverIp = "172.20.10.11";  // Replace with the Python server's IP
        private const int serverPort = 20000;            // Port for communication
        private string receivedData;

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            Thread clientThread = new Thread(ReceiveData);
            clientThread.IsBackground = true; // Set the thread as background to allow the app to exit
            clientThread.Start();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (tcpClient != null && tcpClient.Connected)
            {
                string messageToSend = textBox1.Text;
                SendMessage(messageToSend);
                button1.Enabled = false;
                button1.Text = "Sending...";
                button2.Enabled = false;
            }
        }

        private void ReceiveData()
        {
            try
            {
                tcpClient = new TcpClient(serverIp, serverPort);
                stream = tcpClient.GetStream();

                while (true)
                {
                    receivedData = ReceiveFullMessage();

                    if (receivedData != "Recording..." && receivedData != "Recording finished" 
                        && receivedData != "Transcribing audio..." && receivedData != null)
                    {
                        // Update UI with received data in the main thread
                        Invoke(new Action(() =>
                        {
                            label2.Text = receivedData;
                            button1.Enabled = true;
                            button1.Text = "Send";
                            button2.Enabled = true;
                            button2.Text = "Record";
                        }));
                    }
                    else {
                        Invoke(new Action(() =>
                        {
                            button2.Text = receivedData;
                        }));  } 

                }
            }
            catch (Exception ex)
            {
                Invoke(new Action(() =>
                {
                    MessageBox.Show("Error: " + ex.Message);
                }));
            }
        }

        private void SendMessage(string message)
        {
            try
            {
                byte[] messageBytes = Encoding.UTF8.GetBytes(message);
                byte[] lengthPrefix = BitConverter.GetBytes(messageBytes.Length);

                if (BitConverter.IsLittleEndian)
                    Array.Reverse(lengthPrefix);  // Convert to big-endian

                stream.Write(lengthPrefix, 0, lengthPrefix.Length);
                stream.Write(messageBytes, 0, messageBytes.Length);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Send Error: " + ex.Message);
            }
        }

        private string ReceiveFullMessage()
        {
            try
            {
                byte[] lengthBuffer = new byte[4];
                int bytesRead = stream.Read(lengthBuffer, 0, 4);
                if (bytesRead < 4) return null;  // Invalid length

                if (BitConverter.IsLittleEndian)
                    Array.Reverse(lengthBuffer);  // Convert to big-endian

                int messageLength = BitConverter.ToInt32(lengthBuffer, 0);

                byte[] dataBuffer = new byte[messageLength];
                int totalBytesRead = 0;
                while (totalBytesRead < messageLength)
                {
                    int read = stream.Read(dataBuffer, totalBytesRead, messageLength - totalBytesRead);
                    if (read == 0) return null;
                    totalBytesRead += read;
                }

                return Encoding.UTF8.GetString(dataBuffer);
            }
            catch
            {
                return null;
            }
        }

        // Ensure proper cleanup on application exit
        protected override void OnFormClosing(FormClosingEventArgs e)
        {
            base.OnFormClosing(e);

            // Close the TcpClient and stream when the form is closed
            if (tcpClient != null)
            {
                tcpClient.Close();
                stream.Close();
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (tcpClient != null && tcpClient.Connected)
            {
                string messageToSend = "record";
                SendMessage(messageToSend);
                button1.Enabled = false;
                button1.Text = "Send";
                button2.Enabled = false;
                button2.Text = "Recording";
            }
        }
    }
}
