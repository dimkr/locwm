project('locwm', 'c')

lolibc = subproject('lolibc')

yacc = find_program('yacc')
yacc = generator(yacc,
                 output : '@BASENAME@.c',
                 arguments : ['-o', '@OUTPUT@', '@INPUT@'])
parse_y = yacc.process('parse.y')

cwm = executable('cwm',
                 'calmwm.c', 'screen.c', 'xmalloc.c', 'client.c', 'menu.c',
                 'search.c', 'util.c', 'xutil.c', 'conf.c', 'xevents.c', 'group.c',
                 'kbfunc.c', parse_y,
                 c_args: ['-D_GNU_SOURCE'] + lolibc.get_variable('lolibc_c_args'),
                 include_directories: lolibc.get_variable('lolibc_includes'),
                 dependencies: [
                    dependency('xft'),
                    dependency('freetype2'),
                    dependency('xinerama'),
                    dependency('xrandr'),
                    dependency('x11')
                ],
                link_with: lolibc.get_variable('liblolibc'),
                install: true)

install_man('cwm.1')
install_man('cwmrc.5')
