

CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Account] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Role] [int] NOT NULL,
	[Password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING OFF

/****** Object:  Table [dbo].[GovCounty]    Script Date: 07/27/2012 10:37:23 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[GovCounty](
	[GovCountyID] [int] IDENTITY(1,1) NOT NULL,
	[GovOfficeRegionID] [int] NULL,
	[CountyID] [int] NULL,
 CONSTRAINT [PK_GovCounty] PRIMARY KEY CLUSTERED 
(
	[GovCountyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ReferenceData]    Script Date: 07/27/2012 10:37:23 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

SET ANSI_PADDING ON

CREATE TABLE [dbo].[ReferenceData](
	[RefValue] [int] NOT NULL,
	[RefName] [varchar](100) NULL,
	[RefText] [varchar](100) NOT NULL,
	[RefFrom] [varchar](50) NULL,
	[RefType] [int] NOT NULL,
 CONSTRAINT [PK_ReferenceData] PRIMARY KEY CLUSTERED 
(
	[RefValue] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING OFF

/****** Object:  Table [dbo].[SICCode]    Script Date: 07/27/2012 10:37:23 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

SET ANSI_PADDING ON

CREATE TABLE [dbo].[SICCode](
	[SICID] [int] IDENTITY(1,1) NOT NULL,
	[SICCode] [varchar](50) NOT NULL,
	[TypeOfBusiness] [varchar](200) NOT NULL,
 CONSTRAINT [PK_SICCode] PRIMARY KEY CLUSTERED 
(
	[SICID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING OFF

/****** Object:  Table [dbo].[Country]    Script Date: 07/27/2012 10:37:23 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

SET ANSI_PADDING ON

CREATE TABLE [dbo].[Country](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING OFF

/****** Object:  Table [dbo].[Contact]    Script Date: 07/27/2012 10:37:23 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

SET ANSI_PADDING ON

CREATE TABLE [dbo].[Contact](
	[ContactID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](100) NOT NULL,
	[Surname] [varchar](100) NOT NULL,
	[ManagerID] [int] NULL,
	[ContactType] [varchar](50) NOT NULL,
	[BestContactMethod] [varchar](50) NULL,
	[KnownAs] [varchar](100) NULL,
	[JobRole] [varchar](100) NULL,
	[OfficePhone] [varchar](20) NULL,
	[MobilePhone] [varchar](20) NULL,
	[STHomePhone] [varchar](20) NULL,
	[EmailAddress] [varchar](50) NULL,
	[Workbase] [varchar](100) NULL,
	[JobTitle] [varchar](100) NULL,
	[ContactIsActive] [int] NOT NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING OFF

/****** Object:  Table [dbo].[County]    Script Date: 07/27/2012 10:37:23 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

SET ANSI_PADDING ON

CREATE TABLE [dbo].[County](
	[CountyID] [int] IDENTITY(1,1) NOT NULL,
	[CountryID] [int] NULL,
	[CountyName] [varchar](50) NOT NULL,
	[PostCode] [varchar](10) NOT NULL,
 CONSTRAINT [PK_County] PRIMARY KEY CLUSTERED 
(
	[CountyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING OFF

/****** Object:  Table [dbo].[Programme]    Script Date: 07/27/2012 10:37:23 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

SET ANSI_PADDING ON

CREATE TABLE [dbo].[Programme](
	[ProgrammeID] [int] IDENTITY(1,1) NOT NULL,
	[ProgrammeName] [varchar](100) NOT NULL,
	[Description] [text] NULL,
	[ContactID] [int] NULL,
	[ProgrammeIsActivate] [int] NOT NULL,
 CONSTRAINT [PK_Programme] PRIMARY KEY CLUSTERED 
(
	[ProgrammeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING OFF

/****** Object:  Table [dbo].[Organisation]    Script Date: 07/27/2012 10:37:23 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

SET ANSI_PADDING ON

CREATE TABLE [dbo].[Organisation](
	[OrgID] [int] IDENTITY(1,1) NOT NULL,
	[OrgName] [varchar](100) NOT NULL,
	[OrgShortDescription] [varchar](100) NOT NULL,
	[OrgFullDescription] [text] NULL,
	[LeadContactID] [int] NULL,
	[TypeOfBusiness] [varchar](100) NULL,
	[OrgSICCode] [int] NOT NULL,
	[OrgAddr1] [varchar](150) NOT NULL,
	[OrgAddr2] [varchar](150) NULL,
	[OrgAddr3] [varchar](150) NULL,
	[OrgPostCode] [varchar](50) NOT NULL,
	[OrgPhone] [varchar](50) NOT NULL,
	[OrgFax] [varchar](50) NULL,
	[OrgEmail] [varchar](50) NULL,
	[OrgWebAddr] [varchar](100) NULL,
	[OrgExprList] [text] NULL,
	[OrgCharNumb] [numeric](20, 0) NULL,
	[OrgCompNumb] [numeric](20, 0) NULL,
	[CountryID] [int] NULL,
	[County] [varchar](50) NULL,
	[CityTown] [varchar](50) NULL,
	[RefListID] [text] NULL,
	[OrgIsPreterred] [int] NOT NULL,
	[OrgIsActive] [int] NOT NULL,
	[OrgServiceList] [text] NULL,
	[OrgProgrammeList] [text] NULL,
	[TrustDistrictID] [int] NULL,
	[TrustRegionID] [int] NULL,
	[ExpressionOfInterest] [int] NOT NULL,
 CONSTRAINT [PK_Organisation] PRIMARY KEY CLUSTERED 
(
	[OrgID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING OFF

/****** Object:  Table [dbo].[TrustRegion]    Script Date: 07/27/2012 10:37:23 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

SET ANSI_PADDING ON

CREATE TABLE [dbo].[TrustRegion](
	[TrustRegionID] [int] IDENTITY(1,1) NOT NULL,
	[CountryID] [int] NOT NULL,
	[TrustRegionName] [varchar](100) NOT NULL,
	[TrustRegionDescription] [text] NULL,
	[TrustRegionIsActive] [int] NOT NULL,
 CONSTRAINT [PK_TrustRegion] PRIMARY KEY CLUSTERED 
(
	[TrustRegionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING OFF

/****** Object:  Table [dbo].[TrustDistrict]    Script Date: 07/27/2012 10:37:23 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

SET ANSI_PADDING ON

CREATE TABLE [dbo].[TrustDistrict](
	[TrustDistrictID] [int] IDENTITY(1,1) NOT NULL,
	[TrustRegionID] [int] NOT NULL,
	[TrustDistrictName] [varchar](100) NOT NULL,
	[TrustDistrictDescription] [text] NULL,
	[TrustDistrictIsActive] [int] NOT NULL,
 CONSTRAINT [PK_TrustDistrict] PRIMARY KEY CLUSTERED 
(
	[TrustDistrictID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING OFF

/****** Object:  Table [dbo].[Town]    Script Date: 07/27/2012 10:37:23 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

SET ANSI_PADDING ON

CREATE TABLE [dbo].[Town](
	[TownID] [int] IDENTITY(1,1) NOT NULL,
	[CountyID] [int] NULL,
	[CountryID] [int] NULL,
	[TownName] [varchar](50) NOT NULL,
	[PostCode] [varchar](10) NULL,
 CONSTRAINT [PK_Town] PRIMARY KEY CLUSTERED 
(
	[TownID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING OFF

/****** Object:  Table [dbo].[SupportingMaterial]    Script Date: 07/27/2012 10:37:23 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

SET ANSI_PADDING ON

CREATE TABLE [dbo].[SupportingMaterial](
	[MatID] [int] IDENTITY(1,1) NOT NULL,
	[OrgID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[MatURL] [varchar](100) NOT NULL,
	[MatDescription] [text] NULL,
	[MatType] [varchar](50) NULL,
	[MatAddDate] [datetime] NOT NULL,
	[MatIsActive] [int] NOT NULL,
 CONSTRAINT [PK_SupportingMaterial] PRIMARY KEY CLUSTERED 
(
	[MatID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING OFF

/****** Object:  Table [dbo].[GovOfficeRegion]    Script Date: 07/27/2012 10:37:23 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

SET ANSI_PADDING ON

CREATE TABLE [dbo].[GovOfficeRegion](
	[GovOfficeRegionID] [int] IDENTITY(1,1) NOT NULL,
	[GovOfficeRegionName] [varchar](100) NOT NULL,
	[GovOfficeRegionDescription] [text] NULL,
	[CountyID] [int] NULL,
	[CountryID] [int] NOT NULL,
	[GovIsActivate] [int] NOT NULL,
 CONSTRAINT [PK_GovOfficeRegion] PRIMARY KEY CLUSTERED 
(
	[GovOfficeRegionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING OFF

/****** Object:  Table [dbo].[Service]    Script Date: 07/27/2012 10:37:23 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

SET ANSI_PADDING ON

CREATE TABLE [dbo].[Service](
	[SerID] [int] IDENTITY(1,1) NOT NULL,
	[SerName] [varchar](100) NOT NULL,
	[SerShortDescription] [varchar](100) NOT NULL,
	[SerFullDescription] [text] NULL,
	[SerSubType] [varchar](20) NOT NULL,
	[SerDeptCode] [varchar](20) NOT NULL,
	[LeadContactID] [int] NULL,
	[SerType] [varchar](20) NOT NULL,
	[ClientDescription] [text] NULL,
	[SerDescriptionDelivery] [text] NULL,
	[SerAttendance] [varchar](20) NULL,
	[SerContractCode] [varchar](20) NULL,
	[SerContractValue] [varchar](100) NULL,
	[SerContractRefList] [text] NULL,
	[SerStartExpected] [datetime] NULL,
	[SerStartDate] [datetime] NULL,
	[SerEndDate] [datetime] NULL,
	[SerExtendable] [int] NULL,
	[SerExtendYear] [int] NULL,
	[SerExtendMonth] [int] NULL,
	[SerTimeLimited] [int] NULL,
	[SerTimeLimitedYear] [int] NULL,
	[SerTimeLimitedMonth] [int] NULL,
	[SerStagedPayment] [int] NULL,
	[SerReferralProcess] [varchar](20) NULL,
	[SerDetail2RefList] [text] NULL,
	[ProgrammeID] [int] NULL,
	[SerIsActive] [int] NOT NULL,
	[OtherService] [text] NULL,
	[SerDetail3RefList] [text] NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[SerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING OFF

/****** Object:  Table [dbo].[Directorate]    Script Date: 07/27/2012 10:37:23 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

SET ANSI_PADDING ON

CREATE TABLE [dbo].[Directorate](
	[DirID] [int] IDENTITY(1,1) NOT NULL,
	[OrgID] [int] NOT NULL,
	[LeadContactID] [int] NULL,
	[DirSICCode] [int] NOT NULL,
	[DirName] [varchar](50) NOT NULL,
	[DirShortDescription] [varchar](50) NULL,
	[DirFullDescription] [varchar](50) NULL,
	[DirPostCode] [varchar](50) NOT NULL,
	[DirAddr1] [varchar](150) NOT NULL,
	[DirAddr2] [varchar](150) NULL,
	[DirAddr3] [varchar](150) NULL,
	[DirEmail] [varchar](50) NULL,
	[DirWebAddr] [varchar](100) NULL,
	[DirPhone] [varchar](50) NULL,
	[DirFax] [varchar](50) NULL,
	[DirCharNumb] [decimal](20, 0) NULL,
	[DirCompNumb] [decimal](20, 0) NULL,
	[CountryID] [int] NULL,
	[County] [varchar](50) NULL,
	[CityTown] [varchar](50) NULL,
	[DirIsActive] [int] NOT NULL,
	[TypeOfBusiness] [varchar](100) NULL,
 CONSTRAINT [PK_Directorate] PRIMARY KEY CLUSTERED 
(
	[DirID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING OFF

/****** Object:  Table [dbo].[Premise]    Script Date: 07/27/2012 10:37:23 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

SET ANSI_PADDING ON

CREATE TABLE [dbo].[Premise](
	[PremiseID] [int] IDENTITY(1,1) NOT NULL,
	[LocationName] [varchar](100) NOT NULL,
	[PrimaryLocation] [int] NOT NULL,
	[LocationManaged] [int] NOT NULL,
	[KnownAS] [varchar](100) NULL,
	[RefListID] [text] NULL,
	[LocationOrganisation] [int] NULL,
	[LocationStatus] [varchar](20) NOT NULL,
	[LocationStatusDate] [datetime] NULL,
	[LocationDescription] [text] NULL,
	[PremiseAddr1] [varchar](100) NULL,
	[PremiseAddr2] [varchar](100) NULL,
	[PremiseAddr3] [varchar](100) NULL,
	[PremisePostCode] [varchar](10) NULL,
	[CountryID] [int] NULL,
	[County] [varchar](100) NULL,
	[CityTown] [varchar](100) NULL,
	[PremisePhone] [varchar](50) NOT NULL,
	[PremisFax] [varchar](50) NULL,
	[PremisMinicomn] [varchar](50) NULL,
	[PremiseIsNew] [int] NOT NULL,
	[PremiseShopFlagDate] [datetime] NULL,
	[PremiseSpecialistShop] [int] NOT NULL,
	[SerLinkListID] [text] NULL,
	[PremiseIsActive] [int] NOT NULL,
 CONSTRAINT [PK_Premise] PRIMARY KEY CLUSTERED 
(
	[PremiseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING OFF

/****** Object:  Table [dbo].[PermiseDetailForCost]    Script Date: 07/27/2012 10:37:23 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

SET ANSI_PADDING ON

CREATE TABLE [dbo].[PermiseDetailForCost](
	[PermiseID] [int] NOT NULL,
	[RoomOnlyRate] [varchar](10) NULL,
	[NegotiatedRoomonlyRate] [varchar](10) NULL,
	[BBRate] [varchar](10) NULL,
	[BBNegotiatedRate] [varchar](10) NULL,
	[DBBRate] [varchar](10) NULL,
	[DBBNegotiatedRate] [varchar](10) NULL,
	[DDRate] [varchar](10) NULL,
	[DDNegotiatedRate] [varchar](10) NULL,
	[pre24hrRate] [varchar](10) NULL,
	[pre24hrNeotiatedRate] [varchar](10) NULL,
	[TeaAndCoffee] [varchar](10) NULL,
	[Lunch] [int] NOT NULL,
	[LastNegotiatedDate] [datetime] NULL,
	[RenegotiateOn] [datetime] NULL,
	[NoOfMeetingRooms] [numeric](5, 0) NULL,
	[PreferredStatus] [int] NULL,
	[MeetingRoomRatePerDay] [varchar](10) NULL,
	[Codings] [int] NULL,
	[Comments] [text] NULL,
 CONSTRAINT [PK_PermiseDetailForCost] PRIMARY KEY CLUSTERED 
(
	[PermiseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING OFF

/****** Object:  Table [dbo].[OrganisationLinkService]    Script Date: 07/27/2012 10:37:23 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[OrganisationLinkService](
	[OrgID] [int] NOT NULL,
	[SerID] [int] NOT NULL,
	[Role] [text] NULL,
	[LinkID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_OrganisationLinkService] PRIMARY KEY CLUSTERED 
(
	[LinkID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[Department]    Script Date: 07/27/2012 10:37:23 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

SET ANSI_PADDING ON

CREATE TABLE [dbo].[Department](
	[DepID] [int] IDENTITY(1,1) NOT NULL,
	[DirID] [int] NOT NULL,
	[DepName] [varchar](100) NOT NULL,
	[DepShortDescription] [varchar](100) NOT NULL,
	[DepFullDescription] [text] NULL,
	[TypeOfBusiness] [varchar](100) NOT NULL,
	[DepSICCode] [int] NULL,
	[LeadContactID] [int] NULL,
	[DepPostCode] [varchar](50) NULL,
	[DepAddr1] [varchar](150) NULL,
	[DepAddr2] [varchar](150) NULL,
	[DepAddr3] [varchar](150) NULL,
	[DepPhone] [varchar](50) NULL,
	[DepFax] [varchar](50) NULL,
	[DepEmail] [varchar](50) NULL,
	[DepWebAddr] [varchar](100) NULL,
	[CountryID] [int] NULL,
	[County] [varchar](50) NULL,
	[CityTown] [varchar](50) NULL,
	[DepIsActive] [int] NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING OFF

/****** Object:  Table [dbo].[Address]    Script Date: 07/27/2012 10:37:23 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

SET ANSI_PADDING ON

CREATE TABLE [dbo].[Address](
	[AddressID] [int] IDENTITY(1,1) NOT NULL,
	[Address] [varchar](200) NOT NULL,
	[PostCode] [varchar](10) NOT NULL,
	[TownID] [int] NULL,
	[CountyID] [int] NULL,
	[CountryID] [int] NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING OFF

/****** Object:  Table [dbo].[ProjectMinorWork]    Script Date: 07/27/2012 10:37:23 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

SET ANSI_PADDING ON

CREATE TABLE [dbo].[ProjectMinorWork](
	[PMWID] [int] IDENTITY(1,1) NOT NULL,
	[PremiseID] [int] NOT NULL,
	[PMWDescription] [text] NOT NULL,
	[ProjectOrMinorWork] [int] NOT NULL,
	[PMWIsTBA] [int] NOT NULL,
	[PMWContact] [int] NULL,
	[AuthorisedByName] [int] NULL,
	[PMWStatus] [varchar](20) NULL,
	[PMWEnquiryReceivedDate] [datetime] NOT NULL,
	[AuthorisedDate] [datetime] NULL,
	[ActualStartDate] [datetime] NULL,
	[AnticipatedCompletion] [datetime] NULL,
	[ActualCompletionDate] [datetime] NULL,
	[NotesActions] [text] NULL,
	[EstimatedCost] [varchar](20) NULL,
	[ActualCost] [varchar](20) NULL,
	[Directorate] [int] NULL,
	[PMWIsActive] [int] NOT NULL,
 CONSTRAINT [PK_ProjectMinorWork] PRIMARY KEY CLUSTERED 
(
	[PMWID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING OFF

/****** Object:  Table [dbo].[FundingDetail]    Script Date: 07/27/2012 10:37:23 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

SET ANSI_PADDING ON

CREATE TABLE [dbo].[FundingDetail](
	[SerID] [int] NOT NULL,
	[FundingSource] [varchar](20) NULL,
	[FundingNeeds] [varchar](100) NULL,
	[FundingContractDetail] [int] NOT NULL,
	[FundingAmount] [decimal](11, 2) NOT NULL,
	[FundingContinuationNeeded] [int] NOT NULL,
	[FundingContinuationAmount] [decimal](11, 2) NULL,
	[FundingContinuationDetail] [text] NULL,
	[FundraisingForText] [text] NULL,
	[FundraisingWhy] [text] NULL,
	[FundraisingNeeds] [varchar](100) NULL,
	[FundraisingRequiredBy] [datetime] NULL,
	[FundraisingComplete] [int] NOT NULL,
	[FundraisingCompletedDate] [datetime] NULL,
	[FundraisingDonorAnonymous] [int] NOT NULL,
	[FundraisingDonorAmount] [decimal](11, 2) NULL,
	[FundraisingDonationDate] [datetime] NULL,
	[FundraisingDonationIncremental] [int] NOT NULL,
	[FundingStart] [datetime] NULL,
	[FundingEnd] [datetime] NULL,
 CONSTRAINT [PK_FundingDetail] PRIMARY KEY CLUSTERED 
(
	[SerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING OFF

/****** Object:  Table [dbo].[Facility]    Script Date: 07/27/2012 10:37:23 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

SET ANSI_PADDING ON

CREATE TABLE [dbo].[Facility](
	[FacilityID] [int] IDENTITY(1,1) NOT NULL,
	[PremiseID] [int] NOT NULL,
	[FacilityDescription] [text] NOT NULL,
	[FacilityType] [varchar](20) NOT NULL,
	[RoomCapacity] [numeric](4, 0) NULL,
	[RoomSize] [numeric](4, 0) NULL,
	[RoomConnectivity] [int] NULL,
	[ConnectivityType] [varchar](20) NULL,
	[WirelessAccessInfor] [varchar](100) NULL,
	[LeadContact] [int] NULL,
	[RoomHost] [int] NULL,
	[EquipmentAvailable] [int] NULL,
	[EquipmentName] [varchar](100) NULL,
	[RoomEquipmentNotes] [text] NULL,
	[FacilityIsActive] [int] NOT NULL,
 CONSTRAINT [PK_Facility] PRIMARY KEY CLUSTERED 
(
	[FacilityID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING OFF

/****** Object:  Table [dbo].[PremiseOpenSchedule]    Script Date: 07/27/2012 10:37:23 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

SET ANSI_PADDING ON

CREATE TABLE [dbo].[PremiseOpenSchedule](
	[PremiseID] [int] NOT NULL,
	[StartMonday] [varchar](8) NOT NULL,
	[EndMonday] [varchar](8) NOT NULL,
	[StartTuesday] [varchar](8) NOT NULL,
	[EndTuesday] [varchar](8) NOT NULL,
	[StartWednesday] [varchar](8) NOT NULL,
	[EndWednesday] [varchar](8) NOT NULL,
	[StartThursday] [varchar](8) NOT NULL,
	[EndThursday] [varchar](8) NOT NULL,
	[StartFriday] [varchar](8) NOT NULL,
	[EndFriday] [varchar](8) NOT NULL,
	[StartSaturday] [varchar](8) NOT NULL,
	[EndSaturday] [varchar](8) NOT NULL,
	[StartSunday] [varchar](8) NOT NULL,
	[EndSunday] [varchar](8) NOT NULL,
 CONSTRAINT [PK_PremiseOpenSchedule] PRIMARY KEY CLUSTERED 
(
	[PremiseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING OFF

/****** Object:  Table [dbo].[PremiseLinkService]    Script Date: 07/27/2012 10:37:23 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

SET ANSI_PADDING ON

CREATE TABLE [dbo].[PremiseLinkService](
	[PremiseID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[ProjectCode] [varchar](20) NULL,
	[LinkID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_PremiseLinkService] PRIMARY KEY CLUSTERED 
(
	[LinkID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING OFF

/****** Object:  Table [dbo].[PremiseDetail]    Script Date: 07/27/2012 10:37:23 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

SET ANSI_PADDING ON

CREATE TABLE [dbo].[PremiseDetail](
	[PremiseID] [int] NOT NULL,
	[RefListID] [text] NULL,
	[PremiseJSPListID] [text] NULL,
	[MediaContactCheck] [int] NOT NULL,
	[MediaContact] [int] NULL,
	[MediaContactName] [varchar](100) NULL,
	[CateringFacilities] [int] NOT NULL,
	[CateringContact] [int] NULL,
	[CateringType] [int] NULL,
	[ClientITFacilities] [int] NOT NULL,
	[ClientITFacilitiesDetail] [text] NULL,
	[RoomAvailability] [int] NOT NULL,
	[VolunteeringOpportunuties] [int] NOT NULL,
	[LocalDemographicNote] [text] NULL,
	[PremiseOutreachLocationListID] [text] NULL,
	[PremiseLocalHotelListID] [text] NULL,
	[TravelDetail] [varchar](100) NULL,
	[TravelNearestBus] [varchar](100) NULL,
	[TravelNearestRail] [varchar](100) NULL,
	[TravelNearestAirport] [varchar](100) NULL,
	[VisitorParkingOnsite] [int] NOT NULL,
	[VisitorParkingSpace] [int] NULL,
	[VisitorParkingAlternative] [text] NULL,
	[HostVisits] [int] NOT NULL,
	[HostingContact] [int] NULL,
 CONSTRAINT [PK_PremiseDetail] PRIMARY KEY CLUSTERED 
(
	[PremiseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING OFF

/****** Object:  Table [dbo].[Volunteering]    Script Date: 07/27/2012 10:37:23 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Volunteering](
	[VolunteeringID] [int] IDENTITY(1,1) NOT NULL,
	[PremiseID] [int] NOT NULL,
	[VolunteeringContact] [int] NOT NULL,
	[VolunteeringPurpose] [text] NULL,
	[VolunteeringDetail] [text] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[VolunteerNos] [numeric](4, 0) NULL,
	[VolunteeringIsActive] [int] NOT NULL,
 CONSTRAINT [PK_Volunteering] PRIMARY KEY CLUSTERED 
(
	[VolunteeringID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Table [dbo].[Team]    Script Date: 07/27/2012 10:37:23 ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

SET ANSI_PADDING ON

CREATE TABLE [dbo].[Team](
	[TeamID] [int] IDENTITY(1,1) NOT NULL,
	[DepID] [int] NOT NULL,
	[TeamName] [varchar](100) NOT NULL,
	[TeamShortDescription] [varchar](100) NULL,
	[TeamFullDescription] [text] NULL,
	[LeadContactID] [int] NULL,
	[TypeOfBusiness] [varchar](50) NOT NULL,
	[TeamSICCode] [int] NULL,
	[TeamPostCode] [varchar](50) NULL,
	[TeamAddr1] [varchar](150) NULL,
	[TeamAddr2] [varchar](150) NULL,
	[TeamAddr3] [varchar](150) NULL,
	[TeamEmail] [varchar](50) NULL,
	[TeamWebAddr] [varchar](100) NULL,
	[TeamPhone] [varchar](50) NULL,
	[TeamFax] [varchar](50) NULL,
	[CountryID] [int] NULL,
	[County] [varchar](50) NULL,
	[CityTown] [varchar](50) NULL,
	[TeamIsActive] [int] NOT NULL,
 CONSTRAINT [PK_Team] PRIMARY KEY CLUSTERED 
(
	[TeamID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING OFF

/****** Object:  Default [DF_User_Role]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Role]  DEFAULT ((1)) FOR [Role]

/****** Object:  Default [DF_ReferenceData_RefType]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[ReferenceData] ADD  CONSTRAINT [DF_ReferenceData_RefType]  DEFAULT ((1)) FOR [RefType]

/****** Object:  Default [DF_Contact_ContactType]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[Contact] ADD  CONSTRAINT [DF_Contact_ContactType]  DEFAULT ((0)) FOR [ContactType]

/****** Object:  Default [DF_Contact_ContactIsActive]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[Contact] ADD  CONSTRAINT [DF_Contact_ContactIsActive]  DEFAULT ((1)) FOR [ContactIsActive]

/****** Object:  Default [DF_Programme_ProgrammeIsActivate]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[Programme] ADD  CONSTRAINT [DF_Programme_ProgrammeIsActivate]  DEFAULT ((1)) FOR [ProgrammeIsActivate]

/****** Object:  Default [DF_Organisation_OrgIsPreterred]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[Organisation] ADD  CONSTRAINT [DF_Organisation_OrgIsPreterred]  DEFAULT ((0)) FOR [OrgIsPreterred]

/****** Object:  Default [DF_Organisation_ExpressionofInterest]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[Organisation] ADD  CONSTRAINT [DF_Organisation_ExpressionofInterest]  DEFAULT ((0)) FOR [ExpressionOfInterest]

/****** Object:  Default [DF_TrustRegion_TrustRegionIsActive]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[TrustRegion] ADD  CONSTRAINT [DF_TrustRegion_TrustRegionIsActive]  DEFAULT ((1)) FOR [TrustRegionIsActive]

/****** Object:  Default [DF_TrustDistrict_TrustDistrictIsActive]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[TrustDistrict] ADD  CONSTRAINT [DF_TrustDistrict_TrustDistrictIsActive]  DEFAULT ((1)) FOR [TrustDistrictIsActive]

/****** Object:  Default [DF_SupportingMaterial_MatIsActive]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[SupportingMaterial] ADD  CONSTRAINT [DF_SupportingMaterial_MatIsActive]  DEFAULT ((1)) FOR [MatIsActive]

/****** Object:  Default [DF_GovOfficeRegion_GovIsActivate]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[GovOfficeRegion] ADD  CONSTRAINT [DF_GovOfficeRegion_GovIsActivate]  DEFAULT ((1)) FOR [GovIsActivate]

/****** Object:  Default [DF_Service_SerSubType]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[Service] ADD  CONSTRAINT [DF_Service_SerSubType]  DEFAULT ((0)) FOR [SerSubType]

/****** Object:  Default [DF_Service_SerIsActive]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[Service] ADD  CONSTRAINT [DF_Service_SerIsActive]  DEFAULT ((1)) FOR [SerIsActive]

/****** Object:  Default [DF_Service_OtherService]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[Service] ADD  CONSTRAINT [DF_Service_OtherService]  DEFAULT (',,') FOR [OtherService]

/****** Object:  Default [DF_Service_SerDetail3RefList]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[Service] ADD  CONSTRAINT [DF_Service_SerDetail3RefList]  DEFAULT (',,') FOR [SerDetail3RefList]

/****** Object:  Default [DF_Premise_PrimaryLocation]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[Premise] ADD  CONSTRAINT [DF_Premise_PrimaryLocation]  DEFAULT ((0)) FOR [PrimaryLocation]

/****** Object:  Default [DF_Premise_LocationManaged]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[Premise] ADD  CONSTRAINT [DF_Premise_LocationManaged]  DEFAULT ((0)) FOR [LocationManaged]

/****** Object:  Default [DF_Premise_PremiseIsNew]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[Premise] ADD  CONSTRAINT [DF_Premise_PremiseIsNew]  DEFAULT ((0)) FOR [PremiseIsNew]

/****** Object:  Default [DF_Premise_PremiseSpecialistShop]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[Premise] ADD  CONSTRAINT [DF_Premise_PremiseSpecialistShop]  DEFAULT ((0)) FOR [PremiseSpecialistShop]

/****** Object:  Default [DF_Premise_PremiseIsActive]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[Premise] ADD  CONSTRAINT [DF_Premise_PremiseIsActive]  DEFAULT ((1)) FOR [PremiseIsActive]

/****** Object:  Default [DF_PermiseDetailForCost_Lunch]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[PermiseDetailForCost] ADD  CONSTRAINT [DF_PermiseDetailForCost_Lunch]  DEFAULT ((1)) FOR [Lunch]

/****** Object:  Default [DF_Department_DepIsActive]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [DF_Department_DepIsActive]  DEFAULT ((1)) FOR [DepIsActive]

/****** Object:  Default [DF_ProjectMinorWork_ProjectOrMinorWork]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[ProjectMinorWork] ADD  CONSTRAINT [DF_ProjectMinorWork_ProjectOrMinorWork]  DEFAULT ((1)) FOR [ProjectOrMinorWork]

/****** Object:  Default [DF_Table_1_IsTBA]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[ProjectMinorWork] ADD  CONSTRAINT [DF_Table_1_IsTBA]  DEFAULT ((0)) FOR [PMWIsTBA]

/****** Object:  Default [DF_ProjectMinorWork_PMWIsActive]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[ProjectMinorWork] ADD  CONSTRAINT [DF_ProjectMinorWork_PMWIsActive]  DEFAULT ((1)) FOR [PMWIsActive]

/****** Object:  Default [DF_FundingDetail_FundingContinuationNeeded]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[FundingDetail] ADD  CONSTRAINT [DF_FundingDetail_FundingContinuationNeeded]  DEFAULT ((0)) FOR [FundingContinuationNeeded]

/****** Object:  Default [DF_FundingDetail_FundraisingComplete]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[FundingDetail] ADD  CONSTRAINT [DF_FundingDetail_FundraisingComplete]  DEFAULT ((0)) FOR [FundraisingComplete]

/****** Object:  Default [DF_FundingDetail_FundraisingDonorAnonymous]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[FundingDetail] ADD  CONSTRAINT [DF_FundingDetail_FundraisingDonorAnonymous]  DEFAULT ((0)) FOR [FundraisingDonorAnonymous]

/****** Object:  Default [DF_FundingDetail_FundraisingDonationIncremental]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[FundingDetail] ADD  CONSTRAINT [DF_FundingDetail_FundraisingDonationIncremental]  DEFAULT ((0)) FOR [FundraisingDonationIncremental]

/****** Object:  Default [DF_Facility_FacilityIsActive]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[Facility] ADD  CONSTRAINT [DF_Facility_FacilityIsActive]  DEFAULT ((1)) FOR [FacilityIsActive]

/****** Object:  Default [DF_PremiseOpenSchedule_StartMonday]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[PremiseOpenSchedule] ADD  CONSTRAINT [DF_PremiseOpenSchedule_StartMonday]  DEFAULT ('') FOR [StartMonday]

/****** Object:  Default [DF_PremiseOpenSchedule_EndMonday]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[PremiseOpenSchedule] ADD  CONSTRAINT [DF_PremiseOpenSchedule_EndMonday]  DEFAULT ('') FOR [EndMonday]

/****** Object:  Default [DF_PremiseOpenSchedule_StartTuesday]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[PremiseOpenSchedule] ADD  CONSTRAINT [DF_PremiseOpenSchedule_StartTuesday]  DEFAULT ('') FOR [StartTuesday]

/****** Object:  Default [DF_PremiseOpenSchedule_EndTuesday]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[PremiseOpenSchedule] ADD  CONSTRAINT [DF_PremiseOpenSchedule_EndTuesday]  DEFAULT ('') FOR [EndTuesday]

/****** Object:  Default [DF_PremiseOpenSchedule_StartWednesday]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[PremiseOpenSchedule] ADD  CONSTRAINT [DF_PremiseOpenSchedule_StartWednesday]  DEFAULT ('') FOR [StartWednesday]

/****** Object:  Default [DF_PremiseOpenSchedule_EndWednesday]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[PremiseOpenSchedule] ADD  CONSTRAINT [DF_PremiseOpenSchedule_EndWednesday]  DEFAULT ('') FOR [EndWednesday]

/****** Object:  Default [DF_PremiseOpenSchedule_StartThursday]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[PremiseOpenSchedule] ADD  CONSTRAINT [DF_PremiseOpenSchedule_StartThursday]  DEFAULT ('') FOR [StartThursday]

/****** Object:  Default [DF_PremiseOpenSchedule_EndThursday]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[PremiseOpenSchedule] ADD  CONSTRAINT [DF_PremiseOpenSchedule_EndThursday]  DEFAULT ('') FOR [EndThursday]

/****** Object:  Default [DF_PremiseOpenSchedule_StartFriday]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[PremiseOpenSchedule] ADD  CONSTRAINT [DF_PremiseOpenSchedule_StartFriday]  DEFAULT ('') FOR [StartFriday]

/****** Object:  Default [DF_PremiseOpenSchedule_EndFriday]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[PremiseOpenSchedule] ADD  CONSTRAINT [DF_PremiseOpenSchedule_EndFriday]  DEFAULT ('') FOR [EndFriday]

/****** Object:  Default [DF_PremiseOpenSchedule_StartSaturday]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[PremiseOpenSchedule] ADD  CONSTRAINT [DF_PremiseOpenSchedule_StartSaturday]  DEFAULT ('') FOR [StartSaturday]

/****** Object:  Default [DF_PremiseOpenSchedule_EndSaturday]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[PremiseOpenSchedule] ADD  CONSTRAINT [DF_PremiseOpenSchedule_EndSaturday]  DEFAULT ('') FOR [EndSaturday]

/****** Object:  Default [DF_PremiseOpenSchedule_StartSunday]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[PremiseOpenSchedule] ADD  CONSTRAINT [DF_PremiseOpenSchedule_StartSunday]  DEFAULT ('') FOR [StartSunday]

/****** Object:  Default [DF_PremiseOpenSchedule_EndSunday]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[PremiseOpenSchedule] ADD  CONSTRAINT [DF_PremiseOpenSchedule_EndSunday]  DEFAULT ('') FOR [EndSunday]

/****** Object:  Default [DF_PremiseDetail_MediaContactCheck]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[PremiseDetail] ADD  CONSTRAINT [DF_PremiseDetail_MediaContactCheck]  DEFAULT ((0)) FOR [MediaContactCheck]

/****** Object:  Default [DF_PremiseDetail_CateringFacilities]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[PremiseDetail] ADD  CONSTRAINT [DF_PremiseDetail_CateringFacilities]  DEFAULT ((0)) FOR [CateringFacilities]

/****** Object:  Default [DF_PremiseDetail_ClientITFacilities]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[PremiseDetail] ADD  CONSTRAINT [DF_PremiseDetail_ClientITFacilities]  DEFAULT ((0)) FOR [ClientITFacilities]

/****** Object:  Default [DF_PremiseDetail_RoomAvailability]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[PremiseDetail] ADD  CONSTRAINT [DF_PremiseDetail_RoomAvailability]  DEFAULT ((0)) FOR [RoomAvailability]

/****** Object:  Default [DF_PremiseDetail_VolunteeringOpportunuties]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[PremiseDetail] ADD  CONSTRAINT [DF_PremiseDetail_VolunteeringOpportunuties]  DEFAULT ((0)) FOR [VolunteeringOpportunuties]

/****** Object:  Default [DF_PremiseDetail_VisitorParkingOnsite]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[PremiseDetail] ADD  CONSTRAINT [DF_PremiseDetail_VisitorParkingOnsite]  DEFAULT ((0)) FOR [VisitorParkingOnsite]

/****** Object:  Default [DF_PremiseDetail_HostVisits]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[PremiseDetail] ADD  CONSTRAINT [DF_PremiseDetail_HostVisits]  DEFAULT ((0)) FOR [HostVisits]

/****** Object:  Default [DF_Volunteering_VolunteeringIsActive]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[Volunteering] ADD  CONSTRAINT [DF_Volunteering_VolunteeringIsActive]  DEFAULT ((1)) FOR [VolunteeringIsActive]

/****** Object:  Default [DF_Team_TeamIsActive]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[Team] ADD  CONSTRAINT [DF_Team_TeamIsActive]  DEFAULT ((1)) FOR [TeamIsActive]

/****** Object:  ForeignKey [FK_Contact_Contact]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_Contact] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[Contact] ([ContactID])

ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FK_Contact_Contact]

/****** Object:  ForeignKey [FK_County_Country]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[County]  WITH CHECK ADD  CONSTRAINT [FK_County_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])

ALTER TABLE [dbo].[County] CHECK CONSTRAINT [FK_County_Country]

/****** Object:  ForeignKey [FK_Programme_Contact]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[Programme]  WITH CHECK ADD  CONSTRAINT [FK_Programme_Contact] FOREIGN KEY([ContactID])
REFERENCES [dbo].[Contact] ([ContactID])

ALTER TABLE [dbo].[Programme] CHECK CONSTRAINT [FK_Programme_Contact]

/****** Object:  ForeignKey [FK_Organisation_Contact]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[Organisation]  WITH CHECK ADD  CONSTRAINT [FK_Organisation_Contact] FOREIGN KEY([LeadContactID])
REFERENCES [dbo].[Contact] ([ContactID])

ALTER TABLE [dbo].[Organisation] CHECK CONSTRAINT [FK_Organisation_Contact]

/****** Object:  ForeignKey [FK_TrustRegion_Country]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[TrustRegion]  WITH CHECK ADD  CONSTRAINT [FK_TrustRegion_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])

ALTER TABLE [dbo].[TrustRegion] CHECK CONSTRAINT [FK_TrustRegion_Country]

/****** Object:  ForeignKey [FK_TrustDistrict_TrustRegion]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[TrustDistrict]  WITH CHECK ADD  CONSTRAINT [FK_TrustDistrict_TrustRegion] FOREIGN KEY([TrustRegionID])
REFERENCES [dbo].[TrustRegion] ([TrustRegionID])

ALTER TABLE [dbo].[TrustDistrict] CHECK CONSTRAINT [FK_TrustDistrict_TrustRegion]

/****** Object:  ForeignKey [FK_Town_Country]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[Town]  WITH CHECK ADD  CONSTRAINT [FK_Town_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])

ALTER TABLE [dbo].[Town] CHECK CONSTRAINT [FK_Town_Country]

/****** Object:  ForeignKey [FK_Town_County]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[Town]  WITH CHECK ADD  CONSTRAINT [FK_Town_County] FOREIGN KEY([CountyID])
REFERENCES [dbo].[County] ([CountyID])

ALTER TABLE [dbo].[Town] CHECK CONSTRAINT [FK_Town_County]

/****** Object:  ForeignKey [FK_SupportingMaterial_Organisation]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[SupportingMaterial]  WITH CHECK ADD  CONSTRAINT [FK_SupportingMaterial_Organisation] FOREIGN KEY([OrgID])
REFERENCES [dbo].[Organisation] ([OrgID])

ALTER TABLE [dbo].[SupportingMaterial] CHECK CONSTRAINT [FK_SupportingMaterial_Organisation]

/****** Object:  ForeignKey [FK_SupportingMaterial_User]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[SupportingMaterial]  WITH CHECK ADD  CONSTRAINT [FK_SupportingMaterial_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])

ALTER TABLE [dbo].[SupportingMaterial] CHECK CONSTRAINT [FK_SupportingMaterial_User]

/****** Object:  ForeignKey [FK_GovOfficeRegion_Country]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[GovOfficeRegion]  WITH CHECK ADD  CONSTRAINT [FK_GovOfficeRegion_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])

ALTER TABLE [dbo].[GovOfficeRegion] CHECK CONSTRAINT [FK_GovOfficeRegion_Country]

/****** Object:  ForeignKey [FK_GovOfficeRegion_County]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[GovOfficeRegion]  WITH CHECK ADD  CONSTRAINT [FK_GovOfficeRegion_County] FOREIGN KEY([CountyID])
REFERENCES [dbo].[County] ([CountyID])

ALTER TABLE [dbo].[GovOfficeRegion] CHECK CONSTRAINT [FK_GovOfficeRegion_County]

/****** Object:  ForeignKey [FK_Service_Contact]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_Contact] FOREIGN KEY([LeadContactID])
REFERENCES [dbo].[Contact] ([ContactID])

ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_Contact]

/****** Object:  ForeignKey [FK_Service_Programme]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_Programme] FOREIGN KEY([ProgrammeID])
REFERENCES [dbo].[Programme] ([ProgrammeID])

ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_Programme]

/****** Object:  ForeignKey [FK_Directorate_Contact]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[Directorate]  WITH CHECK ADD  CONSTRAINT [FK_Directorate_Contact] FOREIGN KEY([LeadContactID])
REFERENCES [dbo].[Contact] ([ContactID])

ALTER TABLE [dbo].[Directorate] CHECK CONSTRAINT [FK_Directorate_Contact]

/****** Object:  ForeignKey [FK_Directorate_Organisation]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[Directorate]  WITH CHECK ADD  CONSTRAINT [FK_Directorate_Organisation] FOREIGN KEY([OrgID])
REFERENCES [dbo].[Organisation] ([OrgID])

ALTER TABLE [dbo].[Directorate] CHECK CONSTRAINT [FK_Directorate_Organisation]

/****** Object:  ForeignKey [FK_Premise_Contact]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[Premise]  WITH CHECK ADD  CONSTRAINT [FK_Premise_Contact] FOREIGN KEY([LocationOrganisation])
REFERENCES [dbo].[Contact] ([ContactID])

ALTER TABLE [dbo].[Premise] CHECK CONSTRAINT [FK_Premise_Contact]

/****** Object:  ForeignKey [FK_Premise_Country]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[Premise]  WITH CHECK ADD  CONSTRAINT [FK_Premise_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])

ALTER TABLE [dbo].[Premise] CHECK CONSTRAINT [FK_Premise_Country]

/****** Object:  ForeignKey [FK_Premise_Orgranisation]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[Premise]  WITH CHECK ADD  CONSTRAINT [FK_Premise_Orgranisation] FOREIGN KEY([LocationOrganisation])
REFERENCES [dbo].[Organisation] ([OrgID])

ALTER TABLE [dbo].[Premise] CHECK CONSTRAINT [FK_Premise_Orgranisation]

/****** Object:  ForeignKey [FK_PermiseDetailForCost_Permise]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[PermiseDetailForCost]  WITH CHECK ADD  CONSTRAINT [FK_PermiseDetailForCost_Permise] FOREIGN KEY([PermiseID])
REFERENCES [dbo].[Premise] ([PremiseID])

ALTER TABLE [dbo].[PermiseDetailForCost] CHECK CONSTRAINT [FK_PermiseDetailForCost_Permise]

/****** Object:  ForeignKey [FK_OrganisationLinkService_Organisation]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[OrganisationLinkService]  WITH CHECK ADD  CONSTRAINT [FK_OrganisationLinkService_Organisation] FOREIGN KEY([OrgID])
REFERENCES [dbo].[Organisation] ([OrgID])

ALTER TABLE [dbo].[OrganisationLinkService] CHECK CONSTRAINT [FK_OrganisationLinkService_Organisation]

/****** Object:  ForeignKey [FK_OrganisationLinkService_Service]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[OrganisationLinkService]  WITH CHECK ADD  CONSTRAINT [FK_OrganisationLinkService_Service] FOREIGN KEY([SerID])
REFERENCES [dbo].[Service] ([SerID])

ALTER TABLE [dbo].[OrganisationLinkService] CHECK CONSTRAINT [FK_OrganisationLinkService_Service]

/****** Object:  ForeignKey [FK_Department_Contact]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Contact] FOREIGN KEY([LeadContactID])
REFERENCES [dbo].[Contact] ([ContactID])

ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_Contact]

/****** Object:  ForeignKey [FK_Department_Directorate]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Directorate] FOREIGN KEY([DirID])
REFERENCES [dbo].[Directorate] ([DirID])

ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_Directorate]

/****** Object:  ForeignKey [FK_Address_Country]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])

ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_Country]

/****** Object:  ForeignKey [FK_Address_County]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_County] FOREIGN KEY([CountyID])
REFERENCES [dbo].[County] ([CountyID])

ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_County]

/****** Object:  ForeignKey [FK_Address_Town]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Town] FOREIGN KEY([TownID])
REFERENCES [dbo].[Town] ([TownID])

ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_Town]

/****** Object:  ForeignKey [FK_ProjectMinorWork_AuthorisedByName]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[ProjectMinorWork]  WITH CHECK ADD  CONSTRAINT [FK_ProjectMinorWork_AuthorisedByName] FOREIGN KEY([AuthorisedByName])
REFERENCES [dbo].[Contact] ([ContactID])

ALTER TABLE [dbo].[ProjectMinorWork] CHECK CONSTRAINT [FK_ProjectMinorWork_AuthorisedByName]

/****** Object:  ForeignKey [FK_ProjectMinorWork_Contact]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[ProjectMinorWork]  WITH CHECK ADD  CONSTRAINT [FK_ProjectMinorWork_Contact] FOREIGN KEY([PMWContact])
REFERENCES [dbo].[Contact] ([ContactID])

ALTER TABLE [dbo].[ProjectMinorWork] CHECK CONSTRAINT [FK_ProjectMinorWork_Contact]

/****** Object:  ForeignKey [FK_ProjectMinorWork_Directorate]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[ProjectMinorWork]  WITH CHECK ADD  CONSTRAINT [FK_ProjectMinorWork_Directorate] FOREIGN KEY([Directorate])
REFERENCES [dbo].[Directorate] ([DirID])

ALTER TABLE [dbo].[ProjectMinorWork] CHECK CONSTRAINT [FK_ProjectMinorWork_Directorate]

/****** Object:  ForeignKey [FK_ProjectMinorWork_Premise]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[ProjectMinorWork]  WITH CHECK ADD  CONSTRAINT [FK_ProjectMinorWork_Premise] FOREIGN KEY([PremiseID])
REFERENCES [dbo].[Premise] ([PremiseID])

ALTER TABLE [dbo].[ProjectMinorWork] CHECK CONSTRAINT [FK_ProjectMinorWork_Premise]

/****** Object:  ForeignKey [FK_FundingDetail_Contact]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[FundingDetail]  WITH CHECK ADD  CONSTRAINT [FK_FundingDetail_Contact] FOREIGN KEY([FundingContractDetail])
REFERENCES [dbo].[Contact] ([ContactID])

ALTER TABLE [dbo].[FundingDetail] CHECK CONSTRAINT [FK_FundingDetail_Contact]

/****** Object:  ForeignKey [FK_FundingDetail_Service]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[FundingDetail]  WITH CHECK ADD  CONSTRAINT [FK_FundingDetail_Service] FOREIGN KEY([SerID])
REFERENCES [dbo].[Service] ([SerID])

ALTER TABLE [dbo].[FundingDetail] CHECK CONSTRAINT [FK_FundingDetail_Service]

/****** Object:  ForeignKey [FK_Facility_LeadContact]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[Facility]  WITH CHECK ADD  CONSTRAINT [FK_Facility_LeadContact] FOREIGN KEY([LeadContact])
REFERENCES [dbo].[Contact] ([ContactID])

ALTER TABLE [dbo].[Facility] CHECK CONSTRAINT [FK_Facility_LeadContact]

/****** Object:  ForeignKey [FK_Facility_Premise]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[Facility]  WITH CHECK ADD  CONSTRAINT [FK_Facility_Premise] FOREIGN KEY([PremiseID])
REFERENCES [dbo].[Premise] ([PremiseID])

ALTER TABLE [dbo].[Facility] CHECK CONSTRAINT [FK_Facility_Premise]

/****** Object:  ForeignKey [FK_Facility_RoomHost]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[Facility]  WITH CHECK ADD  CONSTRAINT [FK_Facility_RoomHost] FOREIGN KEY([RoomHost])
REFERENCES [dbo].[Contact] ([ContactID])

ALTER TABLE [dbo].[Facility] CHECK CONSTRAINT [FK_Facility_RoomHost]

/****** Object:  ForeignKey [FK_PremiseOpenSchedule_Premise]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[PremiseOpenSchedule]  WITH CHECK ADD  CONSTRAINT [FK_PremiseOpenSchedule_Premise] FOREIGN KEY([PremiseID])
REFERENCES [dbo].[Premise] ([PremiseID])

ALTER TABLE [dbo].[PremiseOpenSchedule] CHECK CONSTRAINT [FK_PremiseOpenSchedule_Premise]

/****** Object:  ForeignKey [FK_PremiseLinkService_Premise]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[PremiseLinkService]  WITH CHECK ADD  CONSTRAINT [FK_PremiseLinkService_Premise] FOREIGN KEY([PremiseID])
REFERENCES [dbo].[Premise] ([PremiseID])

ALTER TABLE [dbo].[PremiseLinkService] CHECK CONSTRAINT [FK_PremiseLinkService_Premise]

/****** Object:  ForeignKey [FK_PremiseLinkService_Service]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[PremiseLinkService]  WITH CHECK ADD  CONSTRAINT [FK_PremiseLinkService_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([SerID])

ALTER TABLE [dbo].[PremiseLinkService] CHECK CONSTRAINT [FK_PremiseLinkService_Service]

/****** Object:  ForeignKey [FK_PremiseDetail_CateringContact]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[PremiseDetail]  WITH CHECK ADD  CONSTRAINT [FK_PremiseDetail_CateringContact] FOREIGN KEY([CateringContact])
REFERENCES [dbo].[Contact] ([ContactID])

ALTER TABLE [dbo].[PremiseDetail] CHECK CONSTRAINT [FK_PremiseDetail_CateringContact]

/****** Object:  ForeignKey [FK_PremiseDetail_HostContact]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[PremiseDetail]  WITH CHECK ADD  CONSTRAINT [FK_PremiseDetail_HostContact] FOREIGN KEY([HostingContact])
REFERENCES [dbo].[Contact] ([ContactID])

ALTER TABLE [dbo].[PremiseDetail] CHECK CONSTRAINT [FK_PremiseDetail_HostContact]

/****** Object:  ForeignKey [FK_PremiseDetail_MediaContact]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[PremiseDetail]  WITH CHECK ADD  CONSTRAINT [FK_PremiseDetail_MediaContact] FOREIGN KEY([MediaContact])
REFERENCES [dbo].[Contact] ([ContactID])

ALTER TABLE [dbo].[PremiseDetail] CHECK CONSTRAINT [FK_PremiseDetail_MediaContact]

/****** Object:  ForeignKey [FK_PremiseDetail_Premise]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[PremiseDetail]  WITH CHECK ADD  CONSTRAINT [FK_PremiseDetail_Premise] FOREIGN KEY([PremiseID])
REFERENCES [dbo].[Premise] ([PremiseID])

ALTER TABLE [dbo].[PremiseDetail] CHECK CONSTRAINT [FK_PremiseDetail_Premise]

/****** Object:  ForeignKey [FK_Volunteering_Contact]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[Volunteering]  WITH CHECK ADD  CONSTRAINT [FK_Volunteering_Contact] FOREIGN KEY([VolunteeringContact])
REFERENCES [dbo].[Contact] ([ContactID])

ALTER TABLE [dbo].[Volunteering] CHECK CONSTRAINT [FK_Volunteering_Contact]

/****** Object:  ForeignKey [FK_Volunteering_Premise]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[Volunteering]  WITH CHECK ADD  CONSTRAINT [FK_Volunteering_Premise] FOREIGN KEY([PremiseID])
REFERENCES [dbo].[Premise] ([PremiseID])

ALTER TABLE [dbo].[Volunteering] CHECK CONSTRAINT [FK_Volunteering_Premise]

/****** Object:  ForeignKey [FK_Team_Contact]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[Team]  WITH CHECK ADD  CONSTRAINT [FK_Team_Contact] FOREIGN KEY([LeadContactID])
REFERENCES [dbo].[Contact] ([ContactID])

ALTER TABLE [dbo].[Team] CHECK CONSTRAINT [FK_Team_Contact]

/****** Object:  ForeignKey [FK_Team_Department]    Script Date: 07/27/2012 10:37:23 ******/
ALTER TABLE [dbo].[Team]  WITH CHECK ADD  CONSTRAINT [FK_Team_Department] FOREIGN KEY([DepID])
REFERENCES [dbo].[Department] ([DepID])

ALTER TABLE [dbo].[Team] CHECK CONSTRAINT [FK_Team_Department]

      