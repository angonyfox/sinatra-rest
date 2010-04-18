require File.dirname(__FILE__) + '/helper'
require 'dm-core'

class Word
  include DataMapper::Resource
  property :id, Serial
  property :name, String
end

describe 'with datamappper model' do
  
  before(:all) do
    DataMapper.setup(:default, 'sqlite3::memory:')
    DataMapper.auto_migrate!
    @existing_word = Word.create :name => 'existing'
    mock_rest Word
  end
  
  it 'should create new record and redirect to show' do
    post '/words', {:name => 'paleontologist'}
    word = Word.first(:name => 'paleontologist')
    word.should_not be_nil    
    last_response.status.should == 302
    last_response.headers['Location'].should == "/words/#{word.id}"
  end

  it 'should show record' do
    get "/words/#{@existing_word.id}"
    last_response.status.should == 200
    last_response.body.should match @existing_word.name
  end
  
  it 'should load new record' do
    get '/words/new'
    last_response.status.should == 200
    last_response.body.should_not be_empty
  end
  
  it 'should load record edit' do
    get "/words/#{@existing_word.id}/edit"
    last_response.status.should == 200
    last_response.body.should match @existing_word.name
  end
  
  it 'should update record' do
    put "/words/#{@existing_word.id}", {:name => 'changed'}
    changed_word = Word.first(:name => 'changed').should_not be_nil
    last_response.status.should == 302
    last_response.headers['Location'].should_be "/words/#{word.id}"
    changed_word.update :name => 'existing'
  end
  
  it 'should delete record' do
    word = Word.create :name => 'delete_me'
    delete "/words/#{word.id}"
    Word.get(:name => 'delete_me').should be_nil
    last_response.status.should == 302
    last_response.headers['Location'].should == '/words'
  end
  
end