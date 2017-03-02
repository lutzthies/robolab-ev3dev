# Minimal base image for ev3dev on LEGO MINDSTORMS EV3 hardware

FROM ev3dev/debian-jessie-armel-qemu-minbase

COPY layers/debian/ /
COPY layers/base/ /
RUN chmod +x /brickstrap/base/run /brickstrap/base/run.d/* && /brickstrap/base/run

COPY layers/ev3/ /
RUN chmod +x /brickstrap/ev3/run && /brickstrap/ev3/run
