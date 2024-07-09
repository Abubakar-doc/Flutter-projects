# Text-to-Image Generation Mobile Application

## Overview
Welcome to our innovative mobile application that merges the power of AI with Flutter to create a seamless experience in generating images from text. This project not only transforms text into captivating visuals but also integrates various features like background removal, image expansion, cropping, and robust authentication methods for user convenience.

## Features
- **Text Input**: Users can input any text, from simple phrases to complex sentences.
- **Image Generation**: Utilizing advanced AI algorithms, the application converts text into visually appealing images.
- **Customization**: Users can customize various aspects of the generated images, including style, color palette, and more.
- **Authentication Options**: The app offers multiple authentication methods, including Google Sign-In, Facebook Login, mobile number, and email/password authentication, ensuring a secure and seamless experience.
- **Background Removal**: Utilizing AI-based background removal, users can isolate subjects in images effortlessly.
- **Image Expansion and Cropping**: The app provides tools for expanding images and cropping them to desired dimensions, enhancing user control over image output.
- **Light and Dark Theme**: The application supports both light and dark themes to enhance user experience and comfort. Users can switch between these themes in the settings.

## Functionalities
### Personal Accounts and Profiles
- **User Profiles**: Each user has a personal profile where they can manage their information, preferences, and generated images.
- **Account Management**: Users can update their personal information, change passwords, and manage connected authentication methods.
- **Profile Management**: Users can upload a profile picture, set display names, and view their activity within the app.

### In-App Settings
- **Delete Account**: Users have the option to permanently delete their account, which removes all associated data from the app.
- **Logout**: Users can log out of their account, ensuring their data remains secure on shared devices.
- **Theme Switching**: Users can toggle between light and dark themes to suit their preferences and improve usability in different lighting conditions.

## AI Model
- **Model Name**: SD-XL 1.0-base
- **Developed by**: Stability AI
- **Model Type**: Diffusion-based text-to-image generative model
- **Description**: SD-XL consists of an ensemble of experts pipeline for latent diffusion. In a two-stage pipeline, the base model generates latents of the desired output size, and a specialized high-resolution model applies SDEdit technique to the generated latents. The model utilizes two fixed, pretrained text encoders (OpenCLIP-ViT/G and CLIP-ViT/L).
- **Model Sources**: For research purposes, the [generative-models Github repository](https://github.com/Stability-AI/generative-models) provides implementations of popular diffusion frameworks. Clipdrop provides free SDXL inference.

## Technologies Used
- **Flutter**: Leveraging Flutter's versatility and performance for cross-platform mobile application development.
- **Firebase Authentication**: Integrating Firebase Authentication for secure and easy user authentication.
- **Firebase Cloud Firestore**: Storing user data securely using Firebase Cloud Firestore.
- **TensorFlow**: TensorFlow powers the AI models for background removal and text-to-image generation.

## Getting Started
To begin exploring this project:
1. Clone the repository to your local machine.
2. Install Flutter and its dependencies as per the official documentation.
3. Set up Firebase for authentication and Cloud Firestore for data storage.
4. Configure authentication providers such as Google Sign-In and Facebook Login in Firebase Console.
5. Run the application on an emulator or physical device to start generating images and utilizing authentication features.

## Screenshots
### Light Theme
![1](https://github.com/Abubakar-doc/Flutter-projects/assets/137390804/5a93e4d9-a382-410c-ab53-9b9694a10e28)
![2](https://github.com/Abubakar-doc/Flutter-projects/assets/137390804/183bc413-bc1a-4dd6-a1c2-45552486271d)
![3](https://github.com/Abubakar-doc/Flutter-projects/assets/137390804/95642414-e47a-4fe4-8bad-03e07800c5af)
![4](https://github.com/Abubakar-doc/Flutter-projects/assets/137390804/62e51509-3fa9-48de-b6c1-b15fcff82d18)
![5](https://github.com/Abubakar-doc/Flutter-projects/assets/137390804/f39d7047-ef92-42f8-89c4-216410b765b2)
![6](https://github.com/Abubakar-doc/Flutter-projects/assets/137390804/3122a9dc-77c1-4e54-ac4c-a3396a9f60ed)
![7](https://github.com/Abubakar-doc/Flutter-projects/assets/137390804/25c95fcb-6217-46b1-9d25-a8c607a9dcc3)


### Dark Theme
![8](https://github.com/Abubakar-doc/Flutter-projects/assets/137390804/ea95e1f5-6631-4d6c-a176-e6352bd90f68)
![9](https://github.com/Abubakar-doc/Flutter-projects/assets/137390804/77d140c8-4a41-47a1-9d95-75f7298cd08e)


## Acknowledgements
- We extend our gratitude to the Flutter and TensorFlow communities for their continuous support and contributions.
- Special thanks to Firebase for providing reliable authentication and data storage services.
- The advancements in AI technology, particularly the SD-XL model developed by Stability AI, have significantly influenced this project, pushing the boundaries of what's achievable in mobile application development.

## Contact
For any inquiries or feedback regarding this project, feel free to reach out to [developer](mailto:abubakaranjum065@gmail.com). Your feedback is invaluable to us!
