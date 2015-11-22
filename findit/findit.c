/* findit - verify whether a shared object can satisfy a particular reference */
/* Copyright (c) 1997 Duncan Roe & Associates P/L */
/* Copyright (c) 2011 Duncan Roe */
/* Written by: Duncan Roe */
/* $Id: findit.c,v 1.13 2013/02/06 10:49:19 dunc Exp $ */
/*
 *
 * How to Use:-
 *   findit [libraries] [shared object] [entry name]
 * where
 *   <libraries> is as you would specify to gcc,
 *     e.g. "-lm" for the math library;
 *   absolute path names also work as long as they contain ".so".
 *   <shared object> is the path name of the target,
 *   or the bare file name if  the file is in one of the standard places
 *   or somewhere in LD_LIBRARY_PATH
 *   <entry name> is as per program source, e.g. "printf".
 *
 * Examples of Use (program output on ">" lines):-
 *   findit /lib/libc.so.6 printf
 * > Found printf in /lib/libc.so.6 at 0xb77729a0
 *   findit libldap.so ldap_simple_bind_s
 * > Found ldap_simple_bind_s in libldap.so at 0xb76de080
 *
 * If you need <libraries> but don't give them, the system will let you know
 */
#include <stdio.h>
#include <dlfcn.h>
#include <stdlib.h>
#include <string.h>
#ifdef __CYGWIN__
#define CYGXTR 1
#define DOTSO ".dll"
#else
#define CYGXTR 0
#define DOTSO ".so"
#endif
int
main(int argc, char **argv)
{
  char *lib, *libarg;
  const char *error;
  void *handle;
  void *result;
  char *obj, *sym;
  int i;
/*  */
  if (argc < 3)
  {
  usage:
    fprintf(stderr, "Usage: findit [-l<lib> ...] <shared_object> <symbol>\n");
    exit(1);
  }                                /* if(argc!=3) */
  sym = argv[argc - 1];            /* Symbol to find */
  obj = argv[argc - 2];            /* File to search for symbol */
  for (i = 1; i < argc - 2; i++)
  {
    libarg = argv[i];
    if (libarg[0] != '-' || libarg[1] != 'l')
    {
      fprintf(stderr, "Bad library arg: \"%s\"", libarg);
      goto usage;
    }                              /* if(libarg[0]!='-'||libarg[1]!='l') */
    
    // Allow spaces between -l and lib name
    // But not on 3rd-last argument
    if (i < argc - 3 && strlen(libarg) ==2)
      libarg = argv[++i];
    else
      libarg += 2;
    
    if (!(lib = malloc(strlen(libarg) + 7 + CYGXTR))) /* libxxx.(so|dll)\000 */
    {
      fputs("Out of memory!\n", stderr);
      exit(1);
    }                              /* if(!(lib=malloc(strlen(argv[i]+2)) */
    if (!strstr(libarg, DOTSO))
      strcpy(lib, "lib");
    else
      lib[0] = 0;
    strcat(lib, libarg);
    if (!strstr(lib, DOTSO))
      strcat(lib, DOTSO);
    handle = dlopen(lib, RTLD_LAZY | RTLD_GLOBAL);
    if (!handle)
    {
      obj = lib;
      goto openerr;
    }                              /* if(!handle) */
    free(lib);
  }                                /* for(i=1;i<argc-2;i++) */
  handle = dlopen(obj, RTLD_LAZY);
  if (!handle)
  {
  openerr:
    fprintf(stderr, "%s. %s (dlopen)\n", dlerror(), obj);
    exit(1);
  }                                /* if(!handle) */
  result = dlsym(handle, sym);
  if ((error = dlerror()))
  {
    printf("%s. (dlsym)\n", error);
    exit(1);
  }                                /* if((error=dlerror())) */
  printf("Found %s in %s at %p\n", sym, obj, result);
  exit(0);
}                                  /* int main() */
