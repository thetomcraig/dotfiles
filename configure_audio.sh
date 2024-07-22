#!/bin/bash


# Manually construct the list of audio device names and their corresponding IDs
device_names=("external" "internal" "airbuds")
device_ids=("AppleUSBAudioEngine:C-Media Electronics Inc.:USB Advanced Audio Device:3400000:1" "BuiltInSpeakerDevice" "D4-FB-8E-F0-7A-4D:output")

# Function to display the list of audio devices with their indices
display_audio_devices() {
    echo "Available audio devices:"
    for i in "${!device_names[@]}"; do
        echo "$i: ${device_names[$i]}"
    done
}


# Function to switch audio device by index or name
switch_audio_device() {
    local device=$1
    local index

    if [[ "$device" =~ ^[0-9]+$ ]]; then
        # If the argument is a number, use it as the index
        index=$device
    else
        # If the argument is a name, find the index
        for i in "${!device_names[@]}"; do
            if [[ "${device_names[$i]}" == "$device" ]]; then
                index=$i
                break
            fi
        done
    fi

    if [[ -n "$index" ]] && [ "$index" -ge 0 ] && [ "$index" -lt "${#device_ids[@]}" ]; then
        selected_device_name="${device_names[$index]}"
        selected_device_id="${device_ids[$index]}"
        echo "Switching to audio device: $selected_device_name (ID: $selected_device_id)"
        SwitchAudioSource -u "$selected_device_id"
    else
        echo "Invalid selection. Please run the script again with a valid device name or number."
        exit 1
    fi
}

# Check if a command-line argument is provided
if [ "$#" -eq 1 ]; then
    # Use the command-line argument as the device name or index
    device_argument=$1
    switch_audio_device "$device_argument"
else
    # Display the list of devices and prompt for user input
    display_audio_devices
    read -p "Enter the number or name of the audio device you want to switch to: " device_argument
    switch_audio_device "$device_argument"
fi
