FROM kalilinux/kali-rolling
RUN apt-get update && apt-get install -y \
    nmap \
    metasploit-framework \
    netcat-traditional \
    vim \
    git
WORKDIR /root
CMD ["/bin/bash"]
