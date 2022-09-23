FROM node:10

# Create app directory
WORKDIR /usr/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN echo "hello" > "from_the_other_side.txt"

RUN npm install

RUN echo "bippity boppity"

RUN for i in {1..100}; do touch random_file${i}; done

RUN cat from_the_other_side.txt

# installing stuff just because
RUN apt-get update
# seperate RUN lines for more diffs 
RUN apt-get install -y \
  bzr \
  cvs \
  git \
  mercurial \
  subversion 

# Bundle app source
COPY . .

EXPOSE 8080
CMD [ "node", "server.js" ]