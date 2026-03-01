class NotesFolderToMarkdown < Formula
  desc "Round-trip Notes.app folders to Markdown files and back"
  homepage "https://github.com/mgreiner/notes-folder-to-markdown"
  url "https://github.com/mgreiner/notes-folder-to-markdown/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "836db9ba2ba0dd327067176298e8c94dad20edd4ecb83cfac343355f0e664b95"
  license "MIT"

  depends_on :macos

  def install
    libexec.install "export-folder-notes.applescript"
    libexec.install "import-folder-notes.applescript"

    (bin/"export-folder-notes").write <<~EOS
      #!/bin/bash
      osascript "#{libexec}/export-folder-notes.applescript" "$@"
    EOS

    (bin/"import-folder-notes").write <<~EOS
      #!/bin/bash
      osascript "#{libexec}/import-folder-notes.applescript" "$@"
    EOS
  end

  test do
    assert_predicate libexec/"export-folder-notes.applescript", :exist?
    assert_predicate libexec/"import-folder-notes.applescript", :exist?
  end
end
