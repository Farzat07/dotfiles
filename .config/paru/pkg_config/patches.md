# Creating patches for suckless

To apply current patches, use `git am <patch-file>`, which replicates the commit
from which the patch was generated.

To generate the patches, run `git format-patch --suffix=.diff suckless/master`,
which generates the patches from commits since suckless/master.
