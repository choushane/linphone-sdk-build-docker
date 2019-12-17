# Linephone SDK Build Docker
 ## Get Android SDK manager licenses
 ```
     cp -a {ANDROID_SDK_PATH}/licenses/android-sdk-license ./
 ```     
 ## Build docker image & run
 ```
    ./lcs_run.sh up
 ```
 ## Download linphone sdk to source directory
 ``` 
    cd ./source && git clone https://gitlab.linphone.org/BC/public/linphone-sdk.git
 ```
 
  ## Build linphone SDK
 ### Enter container
  
  ```
      cd /home/workspace
      mkdir build && cd build
      cmake .. -DLINPHONESDK_PLATFORM=Android
      cmake --build .
  ```
