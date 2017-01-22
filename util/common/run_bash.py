'''
Run external bash .sh script from Python code
'''
import subprocess


def run_bash(shFile):
  run_bash1(shFile)


def run_bash1(shFile):
  return subprocess.call(shFile, shell=True) #get error code ref. http://stackoverflow.com/a/8724601/248616


def run_bash2(shFile):
  #ref. http://stackoverflow.com/a/4760517/248616
  p = subprocess.Popen([shFile], stdout=subprocess.PIPE)
  output, err = p.communicate()
  print output
  return err

