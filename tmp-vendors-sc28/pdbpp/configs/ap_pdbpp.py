# https://github.com/pdbpp/pdbpp
import pdb

class Config(pdb.DefaultConfig):
    prompt = '(Albert Pdb++) '
    sticky_by_default = False
    editor = 'nvim'
    use_pygments = True
    
    def setup(self, pdb): 
        pass
