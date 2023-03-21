"""Module for iterating directories etc."""
import os
from moviepy.editor import VideoFileClip, concatenate_videoclips
from natsort import natsorted
from dotenv import load_dotenv

load_dotenv()

# https://stackoverflow.com/questions/56920546/combine-mp4-files-by-order-based-on-number-from-filenames-in-python


def merge_video(folder_full_path):
    """merge videos to a single file"""
    videos = []

    for root, _, files in os.walk(folder_full_path):
        # files.sort()
        files = natsorted(files)
        print(root)
        for file in files:
            extension = os.path.splitext(file)[1]
            if extension == '.mp4':
                file_path = os.path.join(root, file)
                video = VideoFileClip(file_path)
                videos.append(video)

        output_video_file = os.path.join(root + ".mp4")
        output_audio_file = os.path.join(root + ".mp3")
        final_clip = concatenate_videoclips(videos)
        final_clip.write_videofile(
            output_video_file, fps=24, remove_temp=False, temp_audiofile=output_audio_file)
        print(output_video_file)


def main():
    """entry function"""
    video_folder = os.getenv('VIDEO_FOLDER')

    for root, dirs, _ in os.walk(video_folder):
        for sub_folder in dirs:
            merge_video(os.path.join(root, sub_folder))


# https://dev.to/jakewitcher/using-env-files-for-environment-variables-in-python-applications-55a1
if __name__ == "__main__":
    main()