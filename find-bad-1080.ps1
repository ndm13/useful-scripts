# Set the directory to search for MKV files to the current directory
$directory = "."

# Set the path to the mkvinfo executable
$mkvinfo_path = "C:\Program Files\MKVToolNix\mkvinfo.exe"

# Set the path to the log file
$log_file = ".\mkv_info.log"

# Find all MKV files in the specified directory and its subdirectories
$mkv_files = Get-ChildItem -Path $directory -Filter "*.mkv" -Recurse

# Iterate through each MKV file
foreach ($file in $mkv_files) {
    # Run the mkvinfo command on the file
    try {
        $info = & $mkvinfo_path $file.FullName
    }
    catch {
        Write-Output "Error reading file $($file.FullName): $($_.Exception.Message)"
        continue
    }

    # Check if the file is 1080p and encoded in H.264
    if ($info | Select-String -Pattern "Pixel height: 1080" -Quiet -ErrorAction SilentlyContinue) {
        if ($info | Select-String -Pattern "Codec ID: V_MPEG4/ISO/AVC" -Quiet -ErrorAction SilentlyContinue) {
            # If the file meets both conditions, print the file name and full path to the terminal and log file
            Write-Output $file.FullName | Out-File -FilePath $log_file -Append
            Write-Output $file.FullName
        }
    }
}
