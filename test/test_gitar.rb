require File.dirname(__FILE__) + '/test_helper.rb'

class TestGitar < Test::Unit::TestCase

  def setup
    @cat = Cat.new
  end
  
  def teardown
    FileUtils.rm_rf('store/.git')
  end

  context 'check the environment' do
    
    should 'support git' do
      assert Gitar::Base.git?
    end
    
    should 'auto-create repository' do
      assert File.directory?('store/.git')
    end
    
  end
  
  context 'object initialization and attributes' do
    
    should 'have a uuid' do
      assert @cat.__uuid__
    end
    
    should 'have an id' do
      assert_match /cat/i, @cat.id
    end
    
    should 'be a new document when new' do
      assert @cat.new_document?
      assert @cat.new_record?
    end
    
    should 'magically set attributes' do
      attribs = { :furry => true, :name => 'Toby' }
      @new_cat = Cat.new(attribs)
      assert_equal attribs, @new_cat.attributes
    end
    
  end

end
