# https://ipython.readthedocs.io/en/stable/config/options/terminal.html

# c.BaseIPythonApplication.auto_create = ~/pnphuong29/projects/p29-github/pnphuong29/ap-scripts-common-sc28/vendors/ipython/configs
# c.BaseIPythonApplication.extra_config_file = ''


# c.HistoryAccessor.hist_file = ~/pnphuong29/projects/p29-github/pnphuong29/ap-scripts-common-sc28/vendors/ipython/configs/profile_default/history.sqlite
# c.HistoryManager.hist_file = ~/pnphuong29/projects/p29-github/pnphuong29/ap-scripts-common-sc28/vendors/ipython/configs/profile_default/history.sqlite


c.TerminalIPythonApp.display_banner = True
c.TerminalIPythonApp.hide_initial_ns = False


c.PrefilterManager.multi_line_specials = True


c.TerminalInteractiveShell.confirm_exit = False
c.TerminalInteractiveShell.editor = 'nvim'
# c.TerminalInteractiveShell.colors = 'NoColor'


c.InteractiveShell.xmode = 'Context'
c.InteractiveShell.cache_size = 1000 # Default: 1000
c.InteractiveShell.color_info = True # Use colors for displaying information about objects
# c.InteractiveShell.colors = 'Neutral' # Set the color scheme (NoColor, Neutral [default], Linux, or LightBG).
c.InteractiveShell.autoindent = True
c.InteractiveShell.automagic = True
c.InteractiveShell.display_page = False
c.InteractiveShell.enable_html_pager = False
c.InteractiveShell.history_length = 10000 # Default: 10000
c.InteractiveShell.history_load_length = 1000 # Default: 1000
c.InteractiveShell.pdb = False # Automatically call the pdb debugger after every exception.


c.InteractiveShellApp.log_level = 20
# c.InteractiveShellApp.gui = 'osx'
c.InteractiveShellApp.hide_initial_ns = False
c.InteractiveShellApp.ignore_cwd = False
c.InteractiveShellApp.exec_PYTHONSTARTUP = True
# c.InteractiveShellApp.module_to_run = ''
# c.InteractiveShellApp.file_to_run = ''
# c.InteractiveShellApp.exec_files = []
# c.InteractiveShellApp.extensions = []
# c.InteractiveShellApp.extra_extensions = []
# c.InteractiveShellApp.exec_lines = []


c.AliasManager.user_aliases = [
    ('l', 'ls -al'),
]
