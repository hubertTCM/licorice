- install

  - reference: https://docs.python.org/3/library/venv.html#:~:text=A%20virtual%20environment%20is%20created,the%20virtual%20environment%20are%20available.

  ```sh
       apt-get install -y python3-venv
       python3 -m venv ./.venv
       source .venv/bin/activate

       pip3 install wheel
       pip3 install moviepy
       pip3 install natsort
       pip3 install python-dotenv
       pip3 install -U autopep8
       pip3 install PyPDF2

       # install whisper (https://github.com/openai/whisper)

       pip install -U openai-whisper
       pip uninstall torch torchvision torchaudio

       pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu126

       whisper test.mp3 --device cpu
       whisper test.mp3 --device cpu --language zh --model large-v3

       # whisper is slow, try SenseVoice
       pip install -U modelscope
  ```

  https://www.stellarinfo.com/blog/repair-corrupt-videos-using-ffmpeg/
