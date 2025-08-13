FROM quay.io/fedora/fedora-bootc@sha256:be300ae11d3694773a437b8755d1af78276b553df99ed57920f1c6feea1fd211

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
