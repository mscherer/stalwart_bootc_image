FROM quay.io/fedora/fedora-bootc@sha256:365e294bae51e53047cf839fdd21896d06a9ab570e683e338511dc6ff58edc51

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
