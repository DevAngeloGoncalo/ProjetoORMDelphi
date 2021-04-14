unit UTiposMelhorados;

interface

uses
  System.SysUtils, System.Classes, DATa.DB;

type
  TIntegerMelhorado = class
  private
    FAssigned: boolean;
    FValue: integer;
    function getValue: integer;
    procedure setValue(const Value: integer);
    function getAssigned: boolean;
    procedure setAssigned(const Value: boolean);

  public
    Procedure LoadFromField(Field: TField);
    property Assigned: boolean read getAssigned write setAssigned;
    property Value: integer read getValue write setValue;
    procedure clear;
  end;

  TStringMelhorado = class
  private
    FAssigned: boolean;
    FValue: string;
    FLen: integer;
    function getValue: string;
    procedure setValue(const Value: string);
    function getAssigned: boolean;
    procedure setAssigned(const Value: boolean);
    function getLen: integer;
    procedure setLen(const Value: integer);

  public
    Procedure LoadFromField(Field: TField);
    property Len: integer read getLen write setLen;
    property Assigned: boolean read getAssigned write setAssigned;
    property Value: string read getValue write setValue;
    procedure clear;
  end;

  TCharMelhorado = class
  private
    FAssigned: boolean;
    FValue: char;
    FLen: integer;
    function getValue: char;
    procedure setValue(const Value: char);
    function getAssigned: boolean;
    procedure setAssigned(const Value: boolean);
    function getLen: integer;
    procedure setLen(const Value: integer);

  public
    Procedure LoadFromField(Field: TField);
    property Len: integer read getLen write setLen;
    property Assigned: boolean read getAssigned write setAssigned;
    property Value: char read getValue write setValue;
    procedure clear;
  end;

  TBoolMelhorado = class
  private
    FAssigned: boolean;
    FValue: boolean;
    function getValue: boolean;
    procedure setValue(const Value: boolean);
    function getAssigned: boolean;
    procedure setAssigned(const Value: boolean);

  public
    property Assigned: boolean read getAssigned write setAssigned;
    property Value: boolean read getValue write setValue;
    Procedure LoadFromField(Field: TField);
    procedure clear;
  end;

  TDateMelhorado = class
  private
    FAssigned: boolean;
    FValue: TDate;
    function getValue: TDate;
    procedure setValue(const Value: TDate);
    function getAssigned: boolean;
    procedure setAssigned(const Value: boolean);

  public
    Procedure LoadFromField(Field: TField);
    property Assigned: boolean read getAssigned write setAssigned;
    property Value: TDate read getValue write setValue;
    procedure clear;
  end;

  TDateTimeMelhorado = class
  private
    FAssigned: boolean;
    FValue: TDateTime;
    function getValue: TDateTime;
    procedure setValue(const Value: TDateTime);
    function getAssigned: boolean;
    procedure setAssigned(const Value: boolean);

  public
    Procedure LoadFromField(Field: TField);
    property Assigned: boolean read getAssigned write setAssigned;
    property Value: TDateTime read getValue write setValue;
    procedure clear;
  end;

implementation

{ TIntegerMelhorado }

procedure TIntegerMelhorado.clear;
begin
  FValue := 0;
  Assigned := false;
end;

function TIntegerMelhorado.getAssigned: boolean;
begin
  result := FAssigned;
end;

function TIntegerMelhorado.getValue: integer;
begin
  result := FValue;
end;

procedure TIntegerMelhorado.LoadFromField(Field: TField);
begin
  if Not(Field.IsNull) then
  BEGIN
    Value := Field.AsInteger;
  END;
end;

procedure TIntegerMelhorado.setAssigned(const Value: boolean);
begin
  FAssigned := Value;
end;

procedure TIntegerMelhorado.setValue(const Value: integer);
begin
  FValue := Value;
  Assigned := true;
end;

{ TStringMelhorado }

procedure TStringMelhorado.clear;
begin
  FValue := '';
  Assigned := false;
end;

function TStringMelhorado.getAssigned: boolean;
begin
  result := FAssigned;
end;

function TStringMelhorado.getLen: integer;
begin
  result := FLen;
end;

function TStringMelhorado.getValue: string;
begin
  result := FValue;
end;

procedure TStringMelhorado.LoadFromField(Field: TField);
begin
  if Not(Field.IsNull) then
  BEGIN
    Value := Field.AsString;
  END;
end;

procedure TStringMelhorado.setAssigned(const Value: boolean);
begin
  FAssigned := Value;
end;

procedure TStringMelhorado.setLen(const Value: integer);
begin
  FLen := Value;
end;

procedure TStringMelhorado.setValue(const Value: string);
begin
  if Length(Value) <= Len then
  begin
    FValue := Value;
    Assigned := true;
  end
  else
  begin
    FValue := Value;
    Assigned := false;
  end;
end;

{ TCharMelhorado }

procedure TCharMelhorado.clear;
begin
  FValue := #0;
  Assigned := false;
end;

function TCharMelhorado.getAssigned: boolean;
begin
  result := FAssigned;
end;

function TCharMelhorado.getLen: integer;
begin
  result := Len;
end;

function TCharMelhorado.getValue: char;
begin
  result := FValue;
end;

procedure TCharMelhorado.LoadFromField(Field: TField);
begin
  if Not(Field.IsNull) then
  BEGIN
    Value := Field.AsString.Chars[0];
  END;
end;

procedure TCharMelhorado.setAssigned(const Value: boolean);
begin
  FAssigned := Value;
end;

procedure TCharMelhorado.setLen(const Value: integer);
begin
  FLen := Value;
end;

procedure TCharMelhorado.setValue(const Value: char);
begin
  FValue := Value;
  Assigned := true;
end;

{ TBoolMelhorado }

procedure TBoolMelhorado.clear;
begin
  FValue := false;
  Assigned := false;
end;

function TBoolMelhorado.getAssigned: boolean;
begin
  result := FAssigned;
end;

function TBoolMelhorado.getValue: boolean;
begin
  result := FValue;
end;

procedure TBoolMelhorado.LoadFromField(Field: TField);
begin
  if Not(Field.IsNull) then
  BEGIN
    Value := Field.AsBoolean;
  END;
end;

procedure TBoolMelhorado.setAssigned(const Value: boolean);
begin
  FAssigned := Value;
end;

procedure TBoolMelhorado.setValue(const Value: boolean);
begin
  FValue := Value;
  Assigned := true;
end;

{ TDateMelhorado }

procedure TDateMelhorado.clear;
begin
  FValue := 00 / 00 / 0000;
  Assigned := false;
end;

function TDateMelhorado.getAssigned: boolean;
begin
  result := FAssigned;
end;

function TDateMelhorado.getValue: TDate;
begin
  result := FValue;
end;

procedure TDateMelhorado.LoadFromField(Field: TField);
begin
  if Not(Field.IsNull) then
  BEGIN
    Value := Field.AsDateTime;
  END;
end;

procedure TDateMelhorado.setAssigned(const Value: boolean);
begin
  FAssigned := Value;
end;

procedure TDateMelhorado.setValue(const Value: TDate);
begin
  FValue := Value;
  Assigned := true;
end;

{ TDateTimeMelhorado }

procedure TDateTimeMelhorado.clear;
begin
  FValue := 00 / 00 / 0000;
  Assigned := false;
end;

function TDateTimeMelhorado.getAssigned: boolean;
begin
  result := FAssigned;
end;

function TDateTimeMelhorado.getValue: TDateTime;
begin
  result := FValue;
end;

procedure TDateTimeMelhorado.LoadFromField(Field: TField);
begin
  if Not(Field.IsNull) then
  BEGIN
    Value := Field.AsDateTime;
  END;
end;

procedure TDateTimeMelhorado.setAssigned(const Value: boolean);
begin
  FAssigned := Value;
end;

procedure TDateTimeMelhorado.setValue(const Value: TDateTime);
begin
  FValue := Value;
  Assigned := true;
end;

end.
