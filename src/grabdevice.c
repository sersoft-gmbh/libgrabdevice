#include <sys/ioctl.h>
#include <linux/input.h>

int grab_device(int fd) {
	return ioctl(fd, EVIOCGRAB, 1);
}

int release_device(int fd) {
	return ioctl(fd, EVIOCGRAB, 0);
}
