FROM debian:sid as download-gpg
RUN apt-get update
RUN apt-get install -y wget
RUN wget -q http://package.perforce.com/perforce.pubkey -O- > perforce-key

FROM debian:sid
RUN apt-get update &&  apt-get install -y gnupg2 gnupg gnupg1
copy --from=download-gpg perforce-key perforce-key
copy perforce.sources.list /etc/apt/sources.list.d/perforce.sources.list
copy run.sh run.sh
#Note the apt-key should not be parsed error comes 
#from combining apt-key add and apt-get update 
#we aren't actually parseing so this warning is okay
RUN apt-key add perforce-key  && apt-get update 
RUN apt-get install -y  helix-p4d
EXPOSE 1666
ENTRYPOINT bash ./run.sh
