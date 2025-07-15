FROM quay.io/fedora/fedora-bootc@sha256:634dafc0fa0be6b37adf7cbf8244bb3eb846638c3ddd5e1231f2c938f2ff6249

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
