# polaris-apim
## Runs WSO2 API Manager 1.9.1 in a docker container with configuration modified to allow passing OAuth JWT Token to configured API Endpoints 

####Docker Build Command to create local image - This needs to be run from the directory dockerfile is in
`docker build -t polaris/apim .`

`docker build -t polaris/apim github.com/scotthuey/polaris-apim`

####Docker run to mount src directory to container for development
`docker run -d --name apim -p 9443:9443 -p 9763:9763 -p 8243:8243 -p 8280:8280 polaris/apim`


