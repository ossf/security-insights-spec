# Security Insights Validator

A Golang command-line tool to help maintainters, developers, and contributors to generate or validate the SECURITY INSIGHTS yaml file.

## Usage

[Docker](https://www.docker.com/) needs to be installed. Build the container image:

```
docker build -t sec-insights-go .
```

If you want to validate a `SECURITY-INSIGHTS.yml`, run the following command:

```
docker run -v $(pwd)/../..:/security-insights -it sec-insights-go si-validator --input /security-insights/examples/security-insights-minimal-sample.yml
```

## Bugs

If you find any bugs, please open an issue or submit a pull request.

## Security

If you find a security vulnerability, please report it via [GitHub private vulnerability reporting](https://docs.github.com/en/code-security/security-advisories/guidance-on-reporting-and-writing-information-about-vulnerabilities/privately-reporting-a-security-vulnerability).

## Authors and Acknowledgment

ossf/security-insights-spec/validators/golang is a fork of [@eddie-knight](https://github.com/eddie-knight/)'s [security-insights-validator](https://github.com/eddie-knight/security-insights-validator) (and we really want to thank for his kindness and contribution 🦄)

