
class HelpAction
  class << self
    def call args, options
      config = Config.get
      print "\nVersion: #{VERSION}".underlined + "\n\n"
      print "Examples:".bold + "\n\n"
      print 'hf 777' + "\n"
      print 'hf save "its a comment"' + "\n"
      print 'hf save master develop "its a comment"' + "\n"
      print 'hf deploy master develop "its a comment"' + "\n"
      print 'hf delete-merged' + "\n"
      print 'hf config' + "\n"
      print 'hf self-update [VERSION]' + "\n"
      print 'hf resolve' + "\n"
      print 'hf reset' + "\n"
      print 'hf get' + "\n"
      print 'hf st' + "\n"
      print 'hf my' + "\n"
      print 'hf init [REMOTE_URL]' + "\n"
      print "\n\n"
      print "Options: ".bold + "\n\n"
      print 'No push: (--local|--l) prevents pushes to remote' + "\n"
      print 'Silent: (--quiet|--q) Skips some messages' + "\n"
      print 'Auto confirmation: (--yes|--y)' + "\n"
      print 'Always commit (todo rethink this option): (--ac)' + "\n"
      print 'Only print commands: (--echo)' + "\n"
      print 'Override mode (autosave to config): --mode=hotfix OR --m=hotfix' + "\n"
      print 'Override project_name (autosave to config): --project_name=customName OR --p=customName' + "\n"
      print 'Skip adding changes from working tree to staging area: --skip-add' + "\n"
      print "\n"
      print "\n"

      print "Current: \n"
      print "mode: #{config['mode'].yellow} \n"
      print "project_name: #{config['project_name'].yellow} \n"

      { cmds: [], danger: false }
    end

    protected

  end
end