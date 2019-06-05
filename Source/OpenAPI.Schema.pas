{******************************************************************************}
{                                                                              }
{  Delphi OpenAPI 3.0 Generator                                                }
{  Copyright (c) 2018-2019 Paolo Rossi                                         }
{  https://github.com/paolo-rossi/delphi-openapi                               }
{                                                                              }
{******************************************************************************}
{                                                                              }
{  Licensed under the Apache License, Version 2.0 (the "License");             }
{  you may not use this file except in compliance with the License.            }
{  You may obtain a copy of the License at                                     }
{                                                                              }
{      http://www.apache.org/licenses/LICENSE-2.0                              }
{                                                                              }
{  Unless required by applicable law or agreed to in writing, software         }
{  distributed under the License is distributed on an "AS IS" BASIS,           }
{  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.    }
{  See the License for the specific language governing permissions and         }
{  limitations under the License.                                              }
{                                                                              }
{******************************************************************************}
unit OpenAPI.Schema;

interface

uses
  System.Classes, System.Generics.Collections, System.JSON,

  Neon.Core.Attributes,
  OpenAPI.Any,
  OpenAPI.Nullables,
  OpenAPI.Reference;

type
  TOPenAPIDiscriminator = class
  private
    FPropertyName: NullString;
    FMapping: TDictionary<string, string>;
  public
    constructor Create;
    destructor Destroy; override;

    /// <summary>
    /// REQUIRED. The name of the property in the payload that will hold the discriminator value.
    /// </summary>
    property PropertyName: NullString read FPropertyName write FPropertyName;

    /// <summary>
    /// An object to hold mappings between payload values and schema names or references.
    /// </summary>
    property Mapping: TDictionary<string, string> read FMapping write FMapping;

  end;

  TOpenAPISchema = class
  private
    FFormat: NullString;
    FTitle: NullString;
    FType_: NullString;
    FDescription: NullString;
    FMaximum: NullDouble;
    FExclusiveMaximum: NullBoolean;
    FMinimum: NullDouble;
    FExclusiveMinimum: NullBoolean;
    FMaxLength: NullInteger;
    FMinLength: NullInteger;
    FPattern: NullString;
    FMultipleOf: NullDouble;
    FReadOnly_: NullBoolean;
    FWriteOnly_: NullBoolean;
    FAllOf: TObjectList<TOpenAPISchema>;
    FOneOf: TObjectList<TOpenAPISchema>;
    FAnyOf: TObjectList<TOpenAPISchema>;
    FNot_: TOpenAPISchema;
    FRequired: TArray<string>;
    FItems: TOpenAPISchema;
    FMaxItems: NullInteger;
    FMinItems: NullInteger;
    FUniqueItems: NullBoolean;
    FProperties: TObjectDictionary<string, TOpenAPISchema>;
    FMaxProperties: NullInteger;
    FMinProperties: NullInteger;
    FAdditionalPropertiesAllowed: NullBoolean;
    FAdditionalProperties: TOpenAPISchema;
    FNullable: NullBoolean;
    FUnresolvedReference: NullBoolean;
    FReference: TOpenAPIReference;
    FDefault_: TOpenAPISchema;
    FEnum: TOpenAPIAny;
  public
    constructor Create;
    destructor Destroy; override;
  public
    /// <summary>
    /// Follow JSON Schema definition: https://tools.ietf.org/html/draft-fge-json-schema-validation-00
    /// While relying on JSON Schema's defined formats,
    /// the OAS offers a few additional predefined formats.
    /// </summary>
    property Format: NullString read FFormat write FFormat;

    /// <summary>
    /// Follow JSON Schema definition. Short text providing information about the data.
    /// </summary>
    property Title: NullString read FTitle write FTitle;

    /// <summary>
    /// Follow JSON Schema definition: https://tools.ietf.org/html/draft-fge-json-schema-validation-00
    /// Value MUST be a string. Multiple types via an array are not supported.
    /// </summary>
    [NeonProperty('type')]
    property Type_: NullString read FType_ write FType_;

    /// <summary>
    /// Follow JSON Schema definition: https://tools.ietf.org/html/draft-fge-json-schema-validation-00
    /// CommonMark syntax MAY be used for rich text representation.
    /// </summary>
    property Description: NullString read FDescription write FDescription;

    /// <summary>
    /// Follow JSON Schema definition: https://tools.ietf.org/html/draft-fge-json-schema-validation-00
    /// </summary>
    property Maximum: NullDouble read FMaximum write FMaximum;

    /// <summary>
    /// Follow JSON Schema definition: https://tools.ietf.org/html/draft-fge-json-schema-validation-00
    /// </summary>
    property ExclusiveMaximum: NullBoolean read FExclusiveMaximum write FExclusiveMaximum;

    /// <summary>
    /// Follow JSON Schema definition: https://tools.ietf.org/html/draft-fge-json-schema-validation-00
    /// </summary>
    property Minimum: NullDouble read FMinimum write FMinimum;

    /// <summary>
    /// Follow JSON Schema definition: https://tools.ietf.org/html/draft-fge-json-schema-validation-00
    /// </summary>
    property ExclusiveMinimum: NullBoolean read FExclusiveMinimum write FExclusiveMinimum;

    /// <summary>
    /// Follow JSON Schema definition: https://tools.ietf.org/html/draft-fge-json-schema-validation-00
    /// </summary>
    property MaxLength: NullInteger read FMaxLength write FMaxLength;

    /// <summary>
    /// Follow JSON Schema definition: https://tools.ietf.org/html/draft-fge-json-schema-validation-00
    /// </summary>
    property MinLength: NullInteger read FMinLength write FMinLength;

    /// <summary>
    /// Follow JSON Schema definition: https://tools.ietf.org/html/draft-fge-json-schema-validation-00
    /// This string SHOULD be a valid regular expression, according to the ECMA 262 regular expression dialect
    /// </summary>
    property Pattern: NullString read FPattern write FPattern;

    /// <summary>
    /// Follow JSON Schema definition: https://tools.ietf.org/html/draft-fge-json-schema-validation-00
    /// </summary>
    property MultipleOf: NullDouble read FMultipleOf write FMultipleOf;

    /// <summary>
    /// Follow JSON Schema definition: https://tools.ietf.org/html/draft-fge-json-schema-validation-00
    /// The default value represents what would be assumed by the consumer of the input as the value of the schema if one is not provided.
    /// Unlike JSON Schema, the value MUST conform to the defined type for the Schema Object defined at the same level.
    /// For example, if type is string, then default can be "foo" but cannot be 1.
    /// </summary>
    //[NeonProperty('default')] [NeonInclude(Include.NotEmpty)]
    //property Default_: TOpenAPISchema read FDefault_ write FDefault_;
    { TODO -opaolo -c : Il risultato � un valore (Any) 21/05/2019 14:47:36 }

    /// <summary>
    /// Relevant only for Schema "properties" definitions. Declares the property as "read only".
    /// This means that it MAY be sent as part of a response but SHOULD NOT be sent as part of the request.
    /// If the property is marked as ReadOnly_ being true and is in the required list,
    /// the required will take effect on the response only.
    /// A property MUST NOT be marked as both ReadOnly_ and WriteOnly_ being true.
    /// Default value is false.
    /// </summary>
    [NeonProperty('readOnly')]
    property ReadOnly_: NullBoolean read FReadOnly_ write FReadOnly_;

    /// <summary>
    /// Relevant only for Schema "properties" definitions. Declares the property as "write only".
    /// Therefore, it MAY be sent as part of a request but SHOULD NOT be sent as part of the response.
    /// If the property is marked as WriteOnly_ being true and is in the required list,
    /// the required will take effect on the request only.
    /// A property MUST NOT be marked as both ReadOnly_ and WriteOnly_ being true.
    /// Default value is false.
    /// </summary>
    [NeonProperty('writeOnly')]
    property WriteOnly_: NullBoolean read FWriteOnly_ write FWriteOnly_;

    /// <summary>
    /// Follow JSON Schema definition: https://tools.ietf.org/html/draft-fge-json-schema-validation-00
    /// Inline or referenced schema MUST be of a Schema Object and not a standard JSON Schema.
    /// </summary>
    [NeonInclude(Include.NotEmpty)]
    property AllOf: TObjectList<TOpenAPISchema> read FAllOf write FAllOf;

    /// <summary>
    /// Follow JSON Schema definition: https://tools.ietf.org/html/draft-fge-json-schema-validation-00
    /// Inline or referenced schema MUST be of a Schema Object and not a standard JSON Schema.
    /// </summary>
    [NeonInclude(Include.NotEmpty)]
    property OneOf: TObjectList<TOpenAPISchema> read FOneOf write FOneOf;

    /// <summary>
    /// Follow JSON Schema definition: https://tools.ietf.org/html/draft-fge-json-schema-validation-00
    /// Inline or referenced schema MUST be of a Schema Object and not a standard JSON Schema.
    /// </summary>
    [NeonInclude(Include.NotEmpty)]
    property AnyOf: TObjectList<TOpenAPISchema> read FAnyOf write FAnyOf;

    /// <summary>
    /// Follow JSON Schema definition: https://tools.ietf.org/html/draft-fge-json-schema-validation-00
    /// Inline or referenced schema MUST be of a Schema Object and not a standard JSON Schema.
    /// </summary>
    [NeonInclude(Include.NotNull)]
    property Not_: TOpenAPISchema read FNot_ write FNot_;

    /// <summary>
    /// Follow JSON Schema definition: https://tools.ietf.org/html/draft-fge-json-schema-validation-00
    /// </summary>
    [NeonInclude(Include.NotEmpty)]
    property Required: TArray<string> read FRequired write FRequired;

    /// <summary>
    /// Follow JSON Schema definition: https://tools.ietf.org/html/draft-fge-json-schema-validation-00
    /// Value MUST be an object and not an array. Inline or referenced schema MUST be of a Schema Object
    /// and not a standard JSON Schema. items MUST be present if the type is array.
    /// </summary>
    [NeonInclude(Include.NotNull)]
    property Items: TOpenAPISchema read FItems write FItems;

    /// <summary>
    /// Follow JSON Schema definition: https://tools.ietf.org/html/draft-fge-json-schema-validation-00
    /// </summary>
    property MaxItems: NullInteger read FMaxItems write FMaxItems;

    /// <summary>
    /// Follow JSON Schema definition: https://tools.ietf.org/html/draft-fge-json-schema-validation-00
    /// </summary>
    property MinItems: NullInteger read FMinItems write FMinItems;

    /// <summary>
    /// Follow JSON Schema definition: https://tools.ietf.org/html/draft-fge-json-schema-validation-00
    /// </summary>
    property UniqueItems: NullBoolean read FUniqueItems write FUniqueItems;

    /// <summary>
    /// Follow JSON Schema definition: https://tools.ietf.org/html/draft-fge-json-schema-validation-00
    /// Property definitions MUST be a Schema Object and not a standard JSON Schema (inline or referenced).
    /// </summary>
    [NeonInclude(Include.NotEmpty)]
    property Properties: TObjectDictionary<string, TOpenAPISchema> read FProperties write FProperties;

    /// <summary>
    /// Follow JSON Schema definition: https://tools.ietf.org/html/draft-fge-json-schema-validation-00
    /// </summary>
    property MaxProperties: NullInteger read FMaxProperties write FMaxProperties;

    /// <summary>
    /// Follow JSON Schema definition: https://tools.ietf.org/html/draft-fge-json-schema-validation-00
    /// </summary>
    property MinProperties: NullInteger read FMinProperties write FMinProperties;

    /// <summary>
    /// Indicates if the schema can contain properties other than those defined by the properties map.
    /// </summary>
    property AdditionalPropertiesAllowed: NullBoolean read FAdditionalPropertiesAllowed write FAdditionalPropertiesAllowed;

    /// <summary>
    /// Follow JSON Schema definition: https://tools.ietf.org/html/draft-fge-json-schema-validation-00
    /// Value can be boolean or object. Inline or referenced schema
    /// MUST be of a Schema Object and not a standard JSON Schema.
    /// </summary>
    [NeonInclude(Include.NotNull)]
    property AdditionalProperties: TOpenAPISchema read FAdditionalProperties write FAdditionalProperties;

    /// <summary>
    /// A free-form property to include an example of an instance for this schema.
    /// To represent examples that cannot be naturally represented in JSON or YAML,
    /// a string value can be used to contain the example with escaping where necessary.
    /// </summary>
    //public IOpenApiAny Example

    /// <summary>
    /// Follow JSON Schema definition: https://tools.ietf.org/html/draft-fge-json-schema-validation-00
    /// </summary>
    property Enum: TOpenAPIAny read FEnum write FEnum;

    /// <summary>
    /// Allows sending a null value for the defined schema. Default value is false.
    /// </summary>
    property Nullable: NullBoolean read FNullable write FNullable;

    /// <summary>
    /// Additional external documentation for this schema.
    /// </summary>
    //ExternalDocs: TOpenApiExternalDocs;

    /// <summary>
    /// This object MAY be extended with Specification Extensions.
    /// </summary>
    //public IDictionary<string, IOpenApiExtension> Extensions  = new Dictionary<string, IOpenApiExtension>();

    /// <summary>
    /// Indicates object is a placeholder reference to an actual object and does not contain valid data.
    /// </summary>
    property UnresolvedReference: NullBoolean read FUnresolvedReference write FUnresolvedReference;

    /// <summary>
    /// Reference object.
    /// </summary>
    [NeonInclude(Include.NotEmpty)]
    property Reference: TOpenAPIReference read FReference write FReference;
  end;


  TOpenAPISchemas = class(TObjectList<TOpenAPISchema>)
  end;

  TOpenAPISchemaMap = class(TObjectDictionary<string, TOpenAPISchema>)
  end;

implementation

{ TOPenAPIDiscriminator }

constructor TOPenAPIDiscriminator.Create;
begin
  FMapping := TDictionary<string, string>.Create;
end;

destructor TOPenAPIDiscriminator.Destroy;
begin
  FMapping.Free;
  inherited;
end;

{ TOpenAPISchema }

constructor TOpenAPISchema.Create;
begin
  //FDefault_ := TOpenAPISchema.Create;
  FAllOf := TObjectList<TOpenAPISchema>.Create(True);
  FOneOf := TObjectList<TOpenAPISchema>.Create(True);
  FAnyOf := TObjectList<TOpenAPISchema>.Create(True);
  //FNot_ := TOpenAPISchema.Create;
  //FItems := TOpenAPISchema.Create;
  FProperties := TObjectDictionary<string, TOpenAPISchema>.Create([doOwnsValues]);
  //FAdditionalProperties := TOpenAPISchema.Create;
  FReference := TOpenAPIReference.Create;
  FEnum := TOpenAPIAny.Create;
end;

destructor TOpenAPISchema.Destroy;
begin
  FReference.Free;
  FAdditionalProperties.Free;
  FProperties.Free;
  FItems.Free;
  FNot_.Free;
  FAnyOf.Free;
  FOneOf.Free;
  FAllOf.Free;
  FDefault_.Free;
  FEnum.Free;

  inherited;
end;

end.
