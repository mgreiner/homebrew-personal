class BookletReorder < Formula
  include Language::Python::Virtualenv

  desc "Convert scanned saddle-stitched booklet PDFs into properly ordered pages"
  homepage "https://github.com/mgreiner/booklet-reorder"
  url "https://github.com/mgreiner/booklet-reorder/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "2fdf8dff449799dab28ba22825702f31e3040e92cdb1e01e540bae74fd544f94"
  license "MIT"

  depends_on "python@3.12"

  resource "pypdf2" do
    url "https://files.pythonhosted.org/packages/9f/bb/18dc3062d37db6c491392007dfd1a7f524bb95886eb956569ac38a23a784/PyPDF2-3.0.1.tar.gz"
    sha256 "a74408f69ba6271f71b9352ef4ed03dc53a31aa404d29b5d31f53bfecfee1440"
  end

  def install
    # Create virtualenv
    venv = virtualenv_create(libexec, "python3.12")

    # Install PyPDF2 from source (pure Python, no compilation needed)
    venv.pip_install resource("pypdf2")

    # Install packages with native code from binary wheels
    # Call pip directly from the virtualenv to allow binary wheels
    system libexec/"bin/python", "-m", "pip", "install",
           "--only-binary=:all:",
           "Pillow>=10.0.0", "PyMuPDF>=1.23.0", "opencv-python>=4.8.0", "numpy>=1.24.0"

    # Install the main package
    venv.pip_install_and_link buildpath
  end

  test do
    system bin/"booklet-reorder", "--help"
  end
end
