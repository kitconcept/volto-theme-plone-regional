FROM plone/plone-backend:6.0.0a1

# Install latest Volto
RUN ./bin/pip install "plone.volto==3.1.0a5" --use-deprecated legacy-resolver

# Create default site
ENV SETUP_CONTENT=True
ENV ADDITIONAL_PROFILES=plone.volto:demo

RUN rm -Rf /app/var &&\
    mkdir -p /app/var/filestorage /app/var/blobstorage /app/var/cache /app/var/log &&\
    /app/docker-entrypoint.sh create-volto
