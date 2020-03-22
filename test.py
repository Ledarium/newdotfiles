#!/usr/bin/env python3
import jenkins
import argparse
from typing import List

parser = argparse.ArgumentParser(description="Process some integers.")
parser.add_argument("integers", metavar="N", type=str)
args = parser.parse_args()

serverurl = "http://jenkins.emzior"
server = jenkins.Jenkins(serverurl, username="d.maylarov", password="sosipisosrabota")
user = server.get_whoami()
version = server.get_version()
print(f"Hello {user['fullName']} from Jenkins {version}")

def run_tests(
    tests: List[str],
    ips=List[str],
    repeat_count=1,
    branch="master",
    jobname="emzos_testing",
):
    server.build_job(
        jobname,
        {
            "MPRTESTER_BRANCH": "develop",
            "BRANCH_OF_TESTS": branch,
            "NETWORK_ID": "204",
            "PROJECT": "vmm2",
            "TEST_MODE": "other",
            "TESTS_TO_RUN": " ".join(tests),
            "TAGS": "",
            "DEBUG_MODE": True,
            "TEST_SUBJECT": "Own-IPs",
            "TEST_SUBJECT_PATH": " ".join(ips),
            "BUILD_NAME_MARK": "api_test",
            "NODE_NAME": "testsystem.emzior",
            "RECIPIENT": "d.maylarov@emzior.ru",
            "REPEAT_COUNT": repeat_count,
        },
    )
    last_build_number = server.get_job_info(jobname)["lastCompletedBuild"]["number"]
    print(f"{serverurl}/job/{jobname}/{last_build_number}/console")

run_tests(args.
