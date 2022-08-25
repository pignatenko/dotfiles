#!/bin/bash

#  <xbar.title>Machine Name</xbar.title>
#  <xbar.version>v1.0.0</xbar.version>
#  <xbar.author>pignatenko</xbar.author>
#  <xbar.author.github>pignatenko</xbar.author.github>
#  <xbar.desc>show the machine name</xbar.desc>
#  <xbar.image></xbar.image>
#  <xbar.dependencies></xbar.dependencies>
#  <xbar.abouturl></xbar.abouturl>


hostname | sed s/\.local//g
