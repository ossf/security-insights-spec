# Command-line Generator and Validator

A Python command-line tool to help maintainters, developers, and contributors to generate or validate the SECURITY INSIGHTS yaml file.

## Usage

Install the requirements using `pip`

```
pip install -r requirements.txt --user
```

If you want to validate a `SECURITY-INSIGHTS.yml`, launch the following command:

```
python validator-and-generator.py verify /path/to/SECURITY-INSIGHTS.yml /path/to/security-insights-schema.yml
```

If you want to create a new `SECURITY-INSIGHTS.yml` by complying the YAML schema, launch this command:

```
python validator-and-generator.py create /path/to/save/SECURITY-INSIGHTS.yml /path/to/security-insights-schema.yml
```

and fill out the questionnaire by following the wizard. The questions labeled with `(optional)` are not mandatory and can be skipped.

## Bugs

If you find any bugs, please open an issue or submit a pull request.

### Known Bugs

- [ ] Value type and format are not printed in the wizard
- [ ] The script accepts just `True` or `False` for boolean values (case sensitive)
- [ ] The script supports just single-line comments

## Security

If you find a security vulnerability, please report it to me privately at luigi[-dot-]gubello[-at-]protonmail.com.



