#!/usr/bin/env ruby

def main
  [
      'test_st',
      'test_save_master',
      'test_deploy_master',
      'test_init',
  ].each do |method|
    print "run #{method} \n"
    send(method)
  end
end

def assert_include?(expected, given)
  throw "Must include: #{expected}. \nGiven: #{given}" unless given.include?(expected)
end

def test_st
  cmds = `hf st --echo`
  assert_include?('git status', cmds)
end

def test_save_master
  cmds = `hf save master "foo comment" --echo`
  assert_include?('foo comment', cmds)
  assert_include?('git checkout master', cmds)
  assert_include?('git merge', cmds)
end

def test_deploy_master
  cmds = `hf deploy master "foo comment" --echo`
  assert_include?('Before committing with deploy', cmds)
  assert_include?('I will speak on: hf deploy master', cmds)
end

def test_init
  cmds = `hf init git@github.com:r1dd1ck777/blockchain_academy_management_dapp.git --echo`
  assert_include?('git init', cmds)
  assert_include?('.gitignore', cmds)
  assert_include?('blockchain_academy_management_dapp', cmds)
  assert_include?('commit', cmds)
  assert_include?('push origin master', cmds)
  assert_include?('push origin develop', cmds)
end

main()
