project('locwm', 'c')

yacc = find_program('yacc')
yacc = generator(yacc,
                 output : '@BASENAME@.c',
                 arguments : ['-o', '@OUTPUT@', '@INPUT@'])
parse_y = yacc.process('parse.y')

cwm = executable('cwm',
                 'calmwm.c', 'screen.c', 'xmalloc.c', 'client.c', 'menu.c',
                 'search.c', 'util.c', 'xutil.c', 'conf.c', 'xevents.c', 'group.c',
                 'kbfunc.c', parse_y,
                 'compat/strlcpy.c', 'compat/strlcat.c', 'compat/strtonum.c',
                 c_args: ['-D_GNU_SOURCE', '-D__dead='],
                 include_directories: include_directories('compat'),
                 dependencies: [
                    dependency('xft'),
                    dependency('freetype2'),
                    dependency('xinerama'),
                    dependency('xrandr'),
                    dependency('x11')
                ],
                install: true)

install_man('cwm.1')
install_man('cwmrc.5')
