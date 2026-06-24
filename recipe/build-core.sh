export SETUPTOOLS_SCM_PRETEND_VERSION="${PKG_VERSION}"
$PYTHON -m pip install . -vv --no-deps --no-build-isolation
# Drop console scripts that require optional packages not pulled in by the core build,
# so no broken wrappers ship (genesis token tools need globus; tf-test needs ptychopinn).
rm -f "$PREFIX/bin/ptychodus-iri-tokens" \
      "$PREFIX/bin/ptychodus-transfer-tokens" \
      "$PREFIX/bin/ptychodus-ptychopinn-tf-test" \
      "$PREFIX/bin/npz-dump"
