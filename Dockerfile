FROM quay.io/fedora/fedora-bootc@sha256:ace3272fea6432880e873f28aac41b509bda7d9bd6267bfa7e807e1b2f7220ca

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
