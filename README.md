# Docker image: Node + Chrome + JRE8

Dockerfile created for Angular application continuous integration.
It contains Node + Chromium + JRE 8 and `npm run` command like Entrypoint.

![Node](https://img.shields.io/docker/v/_/node/14-alpine3.12?label=Node)
![Chromium](https://img.shields.io/badge/Chromium-83.0.4103.116-blue)
![Chromium Driver](https://img.shields.io/badge/Chromium%20Driver-83.0.4103.116-blue)
![JRE 8](https://img.shields.io/badge/OpenJDKJRE-8-blue)

# How to use?

- Create a container to this image with command to run in your `package.json`:
    ```bash
    # Container name: ci-build
    # Script in package.json: build:ci
    docker create --name ci-build guieb/node-chromium-jre8 build:ci
    ```

- Copy your source code to this container (put in `/sources`):
    ```bash
    # Source code: . (current directory in bash)
    # <Container name>/sources: ci-build:/sources
    docker cp . ci-build:/sources
    ```

- Start the container:
    ```bash
    # Container name: ci-build
    # -a: Attach STDOUT/STDERR and forward signals
    sudo docker start ci-build -a 
    ```

# Important

## Karma configuration

It's necessary `ChromeHeadless` and `--no-sandbox`:

```javascript
// karma.conf.js
...,
browsers: ['ChromeHeadlessNoSandbox'],
customLaunchers: {
    ChromeHeadlessNoSandbox: {
        base: 'ChromeHeadless',
        flags: ['--no-sandbox']
    }
},
...
```

## Protractor configuration

It's necessary:
- Change the chrome driver location
- Set `--headless`, `--disable-gpu` and `--no-sandbox`

```javascript
// protractor.conf.js
...,
chromeDriver: '/usr/bin/chromedriver',
capabilities: {
    browserName: 'chrome',
    chromeOptions: {
        args: [
            '--headless',
            '--disable-gpu',
            '--no-sandbox'
        ]
    }
},
...
```
