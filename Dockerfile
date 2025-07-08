FROM quay.io/fedora/fedora-bootc@sha256:8629f3ae2377c0e4d969f3f8048cd44eaca30d5e312fde5288afc7a342b4b4ed

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
