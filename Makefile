# $OpenBSD: Makefile.template,v 1.71 2014/07/10 12:33:17 sthen Exp $
# $FreeBSD/NetBSD: credit FreeBSD/NetBSD if thats where the port came from $
# Original from: credit the original author here
#
# Replace ??? with appropriate values
# Remove extraneous comments before commit.

# Reasons why the port/package shouldn't be built
#
#ONLY_FOR_ARCHS =	???
#NOT_FOR_ARCHS =	???
#SHARED_ONLY =		???
#COMES_WITH =		???
#BROKEN =		reason

#
# Very short description of the package, 60 chars max
#
COMMENT =		lightweight stable fully-featured modern modular IRCd
# COMMENT-foo =		???	for multi packages

#
# What port/package will be created
#
DISTNAME =		inspircd-2.0.19
#PKGNAME =		???
#PKGNAME-foo =		???	for multi packages

# for any port that creates shared libraries.
# both libtool and cmake handle this automatically.
# for libtool-based ports, have a look at WRKBUILD/shared_libs.log
#SHARED_LIBS =		???

# the category used in the directory name, /usr/ports/<category>/portname,
# must be included and listed first.
CATEGORIES =		net

#HOMEPAGE =		???	URL

# where to send bitches about this port
# Put a complete email address with a real name, e.g.,
# MAINTAINER =	John Doe <doe57@machine.somewhere.org>
# if you maintain several ports, try to use the same line each time.
# MAINTAINER implies some amount of responsibility.
# If you no longer use the port, or are unwilling/unable to handle issues
# in a timely manner, *leave the field blank*.
# Default value is ports@openbsd.org, no need to fill in
MAINTAINER =		Toyam Cox <aviator45003@gmail.com>

# Licensing:  This determines what we can distribute.
# When you determine the license type, make sure to look at ALL distfiles.
# Every distfile can have a different license.  The PERMIT_* values are
# determined by the most restrictive license.  If you have two licenses
# that are in conflict, set PERMIT_* based on the most restrictive one.
# Make SURE you get these values right.

# Put a comment there to state what's going on.
# Can be as brief as `BSD' or `GPLv2+', but it'd better be easy to check,
# if someone wants to double-check licensing.
# For GPL, all applicable versions must be included (e.g. v2+, v2 only, v3+).
# Setting PERMIT_PACKAGE_CDROM=Yes defaults other PERMIT_* variables to Yes.
# GPLv2 only
PERMIT_PACKAGE_CDROM =	Yes
#PERMIT_PACKAGE_FTP =	Yes | Reason if No
#PERMIT_DISTFILES_FTP =	Yes | Reason if No

# "make port-lib-depends-check" can help
WANTLIB += m stdc++
#WANTLIB =		???

# where the source files and patches can be fetched
#
#MASTER_SITES =		https://github.com/inspircd/inspircd/archive/
#MASTER_SITES =		${MASTER_SITE_SOURCEFORGE:=subdir/}
#MASTER_SITES =		${MASTER_SITE_foo:=subdir/}

# for github, use these instead of MASTER_SITES (and specify a reasonable
# DISTNAME which will be used as the "save" filename).
# specify the COMMIT as well as the TAG in case upstream slide the tag.
GH_ACCOUNT =		inspircd
GH_PROJECT =		inspircd
GH_TAGNAME =		v2.0.19
#GH_COMMIT =		1548078e5dc304814669cd1ea052f92be9d1ac40

# if more master sites are needed...
#MASTER_SITES0 =
# ...
#DISTFILES =		???
#EXTRACT_ONLY =		???
#EXTRACT_SUFX =		.tar.bz2

#DIST_SUBDIR =		???

# PATCHFILES are also retrieved from MASTER_SITES*
#PATCHFILES =		???
#PATCH_DIST_STRIP =	-p0

# Dependencies
#
#MODULES =		???
#BUILD_DEPENDS =	???
#RUN_DEPENDS =		???
#LIB_DEPENDS =		???
#TEST_DEPENDS =		???

#MAKE_FLAGS =		???
#MAKE_ENV =		???
#FAKE_FLAGS =		???
#TEST_FLAGS =		???

# build/configuration variables
#
#SEPARATE_BUILD =	Yes (build in a directory other than WRKSRC)
#SEPARATE_BUILD =	flavored (distinct flavors may share a common WRKSRC)
#USE_GMAKE =		Yes
#USE_GROFF =		Yes
# Programs that require GNU libtool to build instead of the OpenBSD one
# should use this option.
#USE_LIBTOOL=		gnu
# Set CONFIGURE_STYLE to value corresponding to some standard configuration
# 	  perl [modbuild]: perl's MakeMaker Makefile.PL (modbuild: perl's
#	  Module::Build Build.PL)
# 	  gnu [autoconf] [old] [dest]: gnu style configure (old: no
# 	  sysconfdir), (dest: add DESTDIR, does not handle it),
# 	  (autoconf: needed by port, implies gnu)
# 	XXX: cygnus products do NOT use autoconf for making the main
# 		configure from configure.in
# 	  imake [noman]: port uses imake for configuration.
#	  (noman: no man page installation)
# 	  simple: port has its own configure script
CONFIGURE_STYLE =	gnu
#CONFIGURE_SCRIPT =	??? (if other than configure)
CONFIGURE_ARGS +=	--disable-interactive
CONFIGURE_ARGS +=	--config-dir=/etc/inspircd
CONFIGURE_ARGS +=	--log-dir=/var/log/inspircd
CONFIGURE_ARGS +=	--data-dir=/var/db
CONFIGURE_ARGS +=	--module-dir=/usr/local/lib/inspircd
CONFIGURE_ARGS +=	--binary-dir=/usr/local/libexec
CONFIGURE_ARGS +=	--enable-openssl
CONFIGURE_ARGS +=	--enable-kqueue
CONFIGURE_ARGS +=	--uid=_inspircd
#CONFIGURE_ENV =	???

# for gnu stuff
#AUTOCONF_VERSION =	??? (defaults to 2.13)
#AUTOMAKE_VERSION =	??? (defaults to 1.4)
# config.guess and others are copied here
#MODGNU_CONFIG_GUESS_DIRS = ??? (defaults to ${WRKSRC})

# Is the build automagic or is it interactive
#
#IS_INTERACTIVE =		Yes
#TEST_IS_INTERACTIVE =		Yes

# Assume you have one multiple choice flavor: 1 2 3 and switches a b.
# You would write
#
#FLAVORS =	1 2 3 a b
#FLAVOR ?=
# grab multiple choice value
#CHOICE = ${FLAVOR:Na:Nb}
# check that CHOICE is 1 OR 2 OR 3, or error out
#.if ${CHOICE} == "1"
# code for 1
#.elif ${CHOICE} == "2"
# code for 2
#.elif ${CHOICE} == "3"
# code for 3
#.else
#ERRORS += "Fatal: Conflicting flavor: ${FLAVOR}"
#.endif
# check for switches
#.if ${FLAVOR:Ma}
# code for a
#.endif
#.if ${FLAVOR:Mb}
# code for b
#.endif

# Things that we don't want to do for this port/package
# Generally, DON'T set anything to No if it's not needed.
# The time gained is not worth it.
#
#NO_BUILD =		Yes
NO_TEST =		Yes

# Overrides for default values
#
#CFLAGS =		???
#LDFLAGS =		???
MAKE_FILE =		BSDmakefile
#PKG_ARCH =		??? (* for arch-independent packages)
#WRKDIST =		/usr/ports/pobj/inspircd-2.0.19/inspircd-2.0.19
#WRKSRC =		??? if other than ${WRKDIST}
#WRKBUILD =		??? if other than ${WRKSRC}
#WRKCONF =		??? if other than ${WRKBUILD}

#ALL_TARGET =		???
#INSTALL_TARGET =	???
#TEST_TARGET =		???

.include <bsd.port.mk>
