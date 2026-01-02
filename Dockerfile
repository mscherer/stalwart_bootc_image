FROM quay.io/fedora/fedora-bootc@sha256:97748837871d9bef97a1787597b68839466677c81a4f2174be25d82143b1107a

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
