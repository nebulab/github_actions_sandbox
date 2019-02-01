FROM ruby:2.6.0-alpine3.8

LABEL "com.github.actions.name"="Add QA message"
LABEL "com.github.actions.description"="Adds a QA checklist to the desired issue"
LABEL "com.github.actions.icon"="check-square"
LABEL "com.github.actions.color"="red"

LABEL "repository"="http://github.com/nebulab/github_actions_sandbox"
LABEL "homepage"="http://github.com/nebulab/github_actions_sandbox"
LABEL "maintainer"="Simone Bravo <simonebravo@nebulab.it>"

CMD ["ruby", "/github/workspace/action-add-qa-message/add_qa_on_issue.rb"]
