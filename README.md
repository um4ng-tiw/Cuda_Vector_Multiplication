# Vector Multiplication on Nvidia GPU using CUDA

### About the project
With the Moore's law coming to an end, parallel programming is one of the options to speed up program execution and increase performance. 

![screenshot]

This program is a simple demonstration of how NVIDIA GPUs can be used to perform calculation tasks in a parallel programming domain. The program multiplies two vectors and store the results in another vector. 

### Build With
![cuda-shield] ![c-shield]
* The CUDA program has been written in C language

### Prerequisites
* Make sure you have a NVIDIA GPU so that you can run the program on your local machine.
* You should have CUDA installed on your system and ready to use nvcc

### Execution Guide
* You can execute the program using the following commands on your terminal
* Make sure your terminal points to the current working directory containing the file

```sh
nvcc vector_mul.cu -o vmc
./vmc
```
## Contributing
Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request


## Contact
[![instagram-shield]][instagram]  [![linkedin-shield]][linkedin]

<!-- Links -->
[screenshot]: ./Screenshot.PNG
[cuda-shield]: https://img.shields.io/badge/-CUDA-Green?logo=NVIDIA&logoColor=white&style=for-the-badge
[c-shield]: https://img.shields.io/badge/-C-blue?logo=c&logoColor=white&style=for-the-badge
[instagram-shield]:https://img.shields.io/badge/-instagram-E4405E?logo=instagram&logoColor=white&style=for-the-badge
[linkedin-shield]: https://img.shields.io/badge/-linkedin-0078B6?logo=linkedin&logoColor=white&style=for-the-badge
[linkedin]:https://www.linkedin.com/in/umang-tiwari-bb9781193/
[instagram]:https://www.instagram.com/oxy.moronguy/
