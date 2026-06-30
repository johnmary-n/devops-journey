# Step 1: Use an official web server image as the baseline
FROM nginx:alpine

# Step 2: Copy our custom website files into the web server's internal directory
COPY ./html /usr/share/nginx/html

# Step 3: Expose port 80 inside the container so it can accept web traffic
EXPOSE 80
