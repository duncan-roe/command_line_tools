#define _GNU_SOURCE                /* Required at glibc 2.3.3 */
#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <sys/types.h>
#include <signal.h>
int
main(int argc, char **argv)
{
  int i;
  char *p;
  char tbuf[100];
/*  */
  if (strchr(argv[0], '/'))
    argv[0] = strrchr(argv[0], '/') + 1;
  if (argc != 2)
  {
    fprintf(stderr, "Usage: %s <number>\n", argv[0]);
    return 1;
  }                                /* if(argc!=2) */
  if (sscanf(argv[1], "%d", &i) != 1)
  {
    fprintf(stderr, "Bad decimal number \"%s\"\n", argv[1]);
    return 1;
  }                                /* if(sscanf(argv[1],"%d",&i)!=1) */
  if (!strcmp(argv[0], "strerror"))
    p = strerror(i);
  else if (!strcmp(argv[0], "strsignal"))
    p = strsignal(i);
  else if (!strcmp(argv[0], "kill0"))
  {
    errno = 0;
    kill(i, 0);
    snprintf(tbuf, sizeof tbuf, "%s", strerror(errno));
    p = tbuf;
  }                                /* else if(!strcmp(argv[0],"kill0")) */
  else
  {
    fprintf(stderr,
      "%s must be invoked as \"strerror\" or \"strsignal\" or \"kill0\"\n",
      argv[0]);
    return 1;
  }                                /* else */
  printf("%s returned %s\n", argv[0], p);
  return 0;
}                                  /* int main(int argc,char**argv) */
