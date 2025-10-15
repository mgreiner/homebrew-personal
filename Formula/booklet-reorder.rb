class BookletReorder < Formula
  include Language::Python::Virtualenv

  desc "Convert scanned saddle-stitched booklet PDFs into properly ordered pages"
  homepage "https://github.com/mgreiner/booklet-reorder"
  url "https://github.com/mgreiner/booklet-reorder/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "31b3544aa33d823a78ff8cc7d6f5ec6527492794c9441a127cc599d5fe3a251c"
  license "MIT"

  depends_on "python@3.12"

  resource "pypdf2" do
    url "https://files.pythonhosted.org/packages/9f/bb/18dc3062d37db6c491392007dfd1a7f524bb95886eb956569ac38a23a784/PyPDF2-3.0.1.tar.gz"
    sha256 "a74408f69ba6271f71b9352ef4ed03dc53a31aa404d29b5d31f53bfecfee1440"
  end

  resource "pymupdf" do
    url "https://files.pythonhosted.org/packages/8d/9a/e0a4e92a85fc17be7c54afdbb113f0ade2a8bca49856d510e28bd249e462/pymupdf-1.26.5.tar.gz"
    sha256 "8ef335e07f648492df240f2247854d0e7c0467afb9c4dc2376ec30978ec158c3"
  end

  resource "pillow" do
    url "https://files.pythonhosted.org/packages/source/p/pillow/pillow-11.0.0.tar.gz"
    sha256 "72bacbaf24ac003fea9bff9837d1eedb6088758d41e100c1552930151f677739"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"booklet-reorder", "--help"
  end
end
