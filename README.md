# docker-jackrabbit

This is the Docker image for [Jackrabbit](https://jackrabbit.apache.org/) on an official [Tomcat](http://tomcat.apache.org/) image.

The version tag format is `tomcat_version-jackrabbit_version`. So Tomcat 7 with JackRabbit 2.6.3 is version `7-2.6.3`.

Optional environment variables:
* **JACKRABBIT_LOG_LEVEL**: Not overridden if not supplied. 
* **APACHE_LOG_LEVEL**: Not overridden if not supplied.  

Supported log levels: 
- SEVERE, 
- WARNING, 
- INFO, 
- CONFIG, 
- FINE, 
- FINER, 
- FINEST or 
- ALL

Once started, the repository can be reached at `http://localhost:8080/jackrabbit`

To externalise the repository content, mount a volume at the location that you intend to set as your content repository home directory on the interface. For example:
```
docker run --rm --name "jackrabbit" --mount source=documents,target=/usr/local/share/documents -p 8080:8080 -d crydeestudios/jackrabbit
```
