import collections
import click
import jsonschema
import yaml


def validate_security_insights(security_insights_path, schema_path = "./security-insights-schema-1.0.0.yaml"):
    with open(schema_path, 'r') as file:
        schema = file.read()
    with open(security_insights_path, 'r') as file:
        security_insights = file.read()
    validator = jsonschema.Draft7Validator(yaml.full_load(schema), format_checker=jsonschema.draft7_format_checker)
    errors = validator.iter_errors(yaml.full_load(security_insights))
    errors_json = {"errors": []}
    for error in errors:
        errors_json['errors'].append(error.__dict__)
    return errors_json


def beautiful_print(json_response):
    if json_response['errors']:
        print('Errors')
        print('-----')
        for item in json_response['errors']:
            print("Message: {}".format(item['message']))
            print("Relative schema path: {}".format(list(collections.deque(item['relative_schema_path']))))
            print("$id: {}".format(item['schema']['$id']))
            print('-----')
    else:
        print('No errors found')


# not used in the proper way :(
class NaturalOrderGroup(click.Group):
    def list_commands(self, ctx):
        return self.commands.keys()


@click.group(cls=NaturalOrderGroup)
def security_insights_cli():
    """
    🌈 SECURITY INSIGHTS Generator and Validator\n
    Made with ❤️ by Luigi Gubello\n
    """
    pass


@click.command(help='Verify the SECURITY INSIGHTS yaml according to the schema.')
@click.argument('path', nargs=1, type=click.Path(exists=True))
@click.argument('schema', nargs=1, type=click.Path(exists=True), required=False)
@click.option('--json', 'json_dict', is_flag=True, help='Optional. Print JSON result.')
def verify(path, schema, json_dict):
    if not json_dict:
        response = validate_security_insights(path, schema)
        beautiful_print(response)
    else:
        response = validate_security_insights(path, schema)
        print(response)


security_insights_cli.add_command(verify)
if __name__ == "__main__":
    security_insights_cli()