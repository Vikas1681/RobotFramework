import configparser
import os
strPath=str(os.getcwd())+"\Configuration\Config.ini"
configParser=""
class ConfigHelper:
	def __init__(self):
		print("Inside ConfigHelper Class")
		
	def readConfigFile(self):
		
		with open(strPath) as file:
			global configParser
			configParser= configparser.ConfigParser()
			configParser.read_file(file)
			return configParser
	
	def getConfigValue(self,strConfigSection,strConfigKey):
		return configParser.get(strConfigSection,strConfigKey)
		
