require 'minitest/autorun'
require 'byebug'

class DecongestantTest < Minitest::Test
  def test_task_compiles
    Rake::Task['decongestant:compile'].invoke

    css = <<-CSS
.test {
  background: red;
}
CSS

    assert_equal css, File.read(File.expand_path('../../tmp/application.css', __FILE__))
  end
end
