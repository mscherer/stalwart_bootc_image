FROM quay.io/fedora/fedora-bootc@sha256:8227be40103bdd35ca6b6a9449814e8b38ba04f3d3b0856c076a4becaa63d68d

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
