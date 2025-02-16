import subprocess

subprocess.run(["python", "test.py"], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)


print("finish")
