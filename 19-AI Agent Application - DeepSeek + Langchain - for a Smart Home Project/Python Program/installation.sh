# Update system packages
sudo apt update && sudo apt install -y ffmpeg

# Install Python packages
pip3 install langchain                # Langchain for LLM development
pip3 show langchain                   # Show Langchain details
pip3 install langchain-groq           # Groq integration with Langchain
pip3 install langchain_community      # Langchain community solutions
pip3 install duckduckgo-search        # Internet search and information extraction
pip3 install langdetect               # Language detection
pip3 install gtts                     # Google's Text-to-Speech API
pip3 install -U langsmith             # Track inputs and outputs of LLMs
pip3 install ffmpeg-python            # Python wrapper for FFmpeg
pip3 install git+https://github.com/openai/whisper.git # Whisper for voice-to-text
pip3 install -qU langchain_community wikipedia # Wikipedia research integration
pip3 install ultralytics              # YOLO and object detection
pip3 install git+https://github.com/ultralytics/ultralytics.git@main # Latest YOLO
