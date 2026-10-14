export SETUPTOOLS_SCM_PRETEND_VERSION="${PKG_VERSION}"
$PYTHON -m pip install . -vv --no-deps --no-build-isolation
# pip generates a wrapper for every console script in pyproject.toml, including
# ones whose imports the core build does not satisfy. Drop those so no broken
# wrapper ships; re-check this list every release, the names go stale silently.
#
# ptychodus-reconstruct-*: ptychodus/cli/_reconstruct_common.py imports ptychi at
#   module scope, and ptychi is not on conda-forge.
# ptychodus-store: the store extra (fastapi, fastmcp, uvicorn, sqlalchemy, ...) is
#   not in the run deps, and the GitHub tag archive carries no compiled
#   ptychodus_store/ui/dist/*.js -- that is built by tsc and gitignored upstream --
#   so the served UI would be empty even with the deps present.
rm -f "$PREFIX"/bin/ptychodus-reconstruct-*
rm -f "$PREFIX/bin/ptychodus-store"
